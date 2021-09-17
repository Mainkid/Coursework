import sys

import vk
from DB_Operations.CRUD import CRUD
import configparser
import time
import datetime
import vk.exceptions

class Data_Collector:

    user_id=0
    vk_api:vk.API
    user_fields = """
       photo_id, verified, sex, bdate, city, country, home_town, has_photo, photo_50, photo_100, photo_200_orig, photo_200, photo_400_orig, 
       photo_max, photo_max_orig, online, domain, has_mobile, contacts, site, education, universities, schools, status, last_seen, 
       followers_count, common_count, occupation, nickname, relatives, relation, personal, connections, exports, activities, interests, 
       music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, can_see_audio, can_write_private_message, 
       can_send_friend_request, is_favorite, is_hidden_from_feed, timezone, screen_name, maiden_name, is_friend, friend_status, 
       career, military, blacklisted, blacklisted_by_me, can_be_invited_group,counters
       """
    data: list
    friends_data: list
    wall_posts: list
    photos: list




    def __init__(self, vk_api, version, user_id, user_batch_query,rec_depth, service_msg):
        print('_______________________________')
        config = configparser.ConfigParser()  # создаём объекта парсера
        config.read(r"db_config.ini")  # читаем конфиг
        self.vk_api= vk_api
        self.version= version
        self.user_id= user_id
        d1=CRUD.get_time(self.user_id)
        d2=datetime.datetime.now()
        delta=(d2-d1).days
        if delta >= int(config["postgres"]["delta_time"]):
            print("Seems to be that it's been a long time since we first collected data. Let's collect is ones again")
            CRUD.clear_all_data(self.user_id)


        if (not CRUD.check_user_in_db(self.user_id)) : #Проверка наличия и deltaTime
            if(not self.get_user_data(service_msg)):    # Получаем данные о пользователе
                CRUD.rollback_session()
                return
            CRUD.insert_user_into_table(self.data[0]) #Вставляем в БД все данные о пользователе
            self.insert_friends_into_DB( user_batch_query, rec_depth) #Вставляем в БД информацию, с кем дружит данный пользователь
            if (not self.get_user_wall_posts(100)):
                CRUD.rollback_session()
                return
            self.insert_wall_posts_into_DB(config, user_batch_query,rec_depth-1)
            if (not self.get_photos(config)):
                CRUD.rollback_session()
                return
            self.insert_photos_into_DB(config, user_batch_query,rec_depth-1)
            CRUD.commit_adding_user()
            print('New user added successfuly...')
            data = 'OK'
            #service_msg.append(data)
        else:
            print('This user is already exists')





    def get_user_data(self,service_msg):
        try:
            self.data = self.vk_api.users.get(user_ids=self.user_id, name_case="Nom", fields=self.user_fields, v=self.version)  #Получаем данные пользователя
            self.friends_data=self.vk_api.friends.get(user_id=self.user_id, name_case="Nom", v=self.version)
        except vk.exceptions.VkAPIError as e:
            if (e.code==5):
                print("#######USER IS BLOCKED!########")
                sys.exit()
            #service_msg.append('FAIL')
            print('ErrorCode: ' + str(e.code))
            print(e)
            return False
        print('Pulling users data from id='+str(self.user_id))
        return True

    def insert_friends_into_DB(self, user_batch_query,rec_depth):
        print('Adding users friends to the global query')
        if rec_depth<=1:
            return
        for i in range(0, self.friends_data.get('count'), +5000):
            CRUD.insert_friends_into_table(self.user_id,self.friends_data, i, user_batch_query,rec_depth-1)
        #___________ДОБАВИТЬ ДРУГА К ГЛОБАЛЬНОЙ ОЧЕРЕДИ_________________

    def get_user_wall_posts(self, amount_of_posts):
        print('Pulling user wall posts...')
        try:
            self.wall_posts= self.vk_api.wall.get(owner_id=self.user_id, count=amount_of_posts, v=self.version)
        except vk.exceptions.VkAPIError as e:
            print('ErrorCode: ' + str(e.code))
            print(e)
            return False
        return True

    def insert_wall_posts_into_DB(self,config, user_batch_query,rec_depth):
        wall_items_list=self.wall_posts.get('items')
        print('Inserting users wall posts in DB...')
        for i in range(0, min(len(wall_items_list),100,int( config["wallposts"]["maxPosts"]))):
            CRUD.add_wall_post_into_db(self.user_id, wall_items_list[i])
            try:
                commentary_list= self.vk_api.wall.getComments(owner_id=self.user_id,post_id=wall_items_list[i].get('id'),v=self.version,thread_items_count=config["comments"]["maxThreadItems"])
            except vk.exceptions.VkAPIError as e:
                print('ErrorCode: '+str(e.code))
                print(e)
                return False
            time.sleep(1)

            self.add_new_comment_into_DB(wall_items_list[i].get('id'),commentary_list,config, 'post', user_batch_query,rec_depth)
            if (self.insert_object_liked_users(wall_items_list[i].get('id'), 'post')==False):
                return False
            self.insert_post_reposted_users(wall_items_list[i].get('id'))

        return True

    def add_new_comment_into_DB(self,object_id, commetary_list, config, object_type, user_batch_query,rec_depth):
        print('Adding comments for the referenced object...')
        comments=commetary_list.get('items')
        if comments is None:
            return
        for i in range (0,min(20,int(config["comments"]["maxComments"]),len(comments))):
             CRUD.add_object_comment_into_db(self.user_id,object_id,comments[i],object_type, user_batch_query,rec_depth)
             self.insert_comment_liked_users(object_id,comments[i].get('id'),object_type)
             if (comments[i].get('thread') is not None):
                self.add_new_comment_into_DB(object_id, comments[i].get('thread'), config,object_type, user_batch_query,rec_depth)

    def insert_object_liked_users(self,object_id, type_of_obj):
        try:
            liked_users_list=self.vk_api.likes.getList(type=type_of_obj, owner_id=self.user_id, item_id=object_id,v=self.version)
            time.sleep(1)
        except vk.exceptions.VkAPIError as e:
            print('ErrorCode: ' + str(e.code))
            print(e)
            return False
        if (len(liked_users_list.get('items'))>0):
            CRUD.insert_user_liked_object(liked_users_list.get('items'), self.user_id,object_id, type_of_obj)
            return True
        return False

    def insert_comment_liked_users(self,wallpost_id,comment_id,object_type):
        try:
            liked_users_list=self.vk_api.likes.getList(type='comment', owner_id=self.user_id, item_id=comment_id,v=self.version)
        except vk.exceptions.VkAPIError as e:
            print('ErrorCode: ' + str(e.code))
            print(e)
            return False
        time.sleep(1)
        if (len(liked_users_list.get('items')) > 0):
            CRUD.insert_user_liked_object_comment(liked_users_list.get('items'),self.user_id,wallpost_id,comment_id,object_type)
            return True
        return False

    def insert_post_reposted_users(self,wallpost_id):
        reposted_user_list=self.vk_api.wall.getReposts(owner_id=self.user_id, post_id=wallpost_id, v=self.version)
        time.sleep(1)
        if (len(reposted_user_list.get('items'))>0):
            CRUD.insert_user_reposted_post(reposted_user_list.get('items'), self.user_id, wallpost_id)

    def get_photos(self,config):
        print('Pulling users photos...')
        try:
            self.photos= self.vk_api.photos.getAll(owner_id=self.user_id, count=config["photos"]["maxPhotos"], v=self.version)
        except vk.exceptions.VkAPIError as e:
            print('ErrorCode: ' + str(e.code))
            print(e)
            return False
        print('Pulling user photos...')
        return True

    def insert_photos_into_DB(self,config, user_batch_query,rec_depth):
        ('Adding photos into DB...')
        photosList=self.photos.get('items')
        for i in range(len(photosList)):
            CRUD.insert_user_photo_data(self.user_id, photosList[i])
            self.insert_object_liked_users(photosList[i].get('id'),'photo')
            try:
                commentary_list= self.vk_api.photos.getComments(owner_id=self.user_id, photo_id=photosList[i].get('id'),v=self.version, thread_items_count=config["comments"]["maxThreadItems"])
            except vk.exceptions.VkAPIError as e:
                print('ErrorCode: '+str(e.code))
                print(e)
                return False
            time.sleep(1)
            self.add_new_comment_into_DB(photosList[i].get('id'), commentary_list, config, 'photo', user_batch_query,rec_depth)

