import vk
from DB_Operations.CRUD import CRUD
import configparser
import time
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
    friends_data:list
    wall_posts: list
    albums: list
    photos: list



    def __init__(self, vk_api, version, user_id):
        config = configparser.ConfigParser()  # создаём объекта парсера
        config.read(r"config.ini")  # читаем конфиг
        self.vk_api= vk_api
        self.version= version
        self.user_id= user_id
        if not CRUD.check_user_in_db(self.user_id): #Проверка наличия
            if(not self.get_user_data()):    # Получаем данные о пользователе
                CRUD.rollback_session()
                return
            CRUD.insert_user_into_table(self.data[0]) #Вставляем в БД все данные о пользователе
            self.insert_friends_into_DB() #Вставляем в БД информацию, с кем дружит данный пользователь
            if (not self.get_user_wall_posts(100)):
                CRUD.rollback_session()
                return
            self.insert_wall_posts_into_DB(config)
            CRUD.commit_adding_user()
            print('New user added successfuly...')
        else:
            print('This user is already exists')
        #self.get_user_albums(10)
        #self.get_user_photos(10)




    def get_user_data(self):
        try:
            self.data = self.vk_api.users.get(user_ids=self.user_id, name_case="Nom", fields=self.user_fields, v=self.version)  #Получаем данные пользователя
            self.friends_data=self.vk_api.friends.get(user_id=self.user_id, name_case="Nom", v=self.version)
        except vk.exceptions.VkAPIError as e:
            print('ErrorCode: ' + str(e.code))
            print(e)
            return False
        print('Pulling users data from id='+str(self.user_id))
        self.push_user_data_into_db()
        return True


    def insert_friends_into_DB(self):
        for i in range(0, self.friends_data.get('count'), +5000):
            CRUD.insert_friends_into_table(self.user_id,self.friends_data, i)
        #___________ДОБАВИТЬ ДРУГА К ГЛОБАЛЬНОЙ ОЧЕРЕДИ_________________


    #  Сначала нужно получить альбом!
    def get_user_wall_posts(self, amount_of_posts):
        try:
            self.wall_posts= self.vk_api.wall.get(owner_id=self.user_id, count=amount_of_posts, v=self.version)
        except vk.exceptions.VkAPIError as e:
            print('ErrorCode: ' + str(e.code))
            print(e)
            return False
        print('Puling user wall posts...')
        return True

    def get_user_albums (self, amount_of_albums):
        self.albums = self.vk_api.photos.getAlbums(owner_id=self.user_id, count=amount_of_albums, v=self.version)
        print('Puling user albums posts...')

    def get_user_photos(self,  amount_of_photos):
        for i in range(len(self.albums)):
           # self.photos = self.vk_api.photos.get(owner_id=self.user_id, count=amount_of_photos, v=self.version, album_id=self.albums.items[i].id)
            print('Puling user photos...')

    def push_user_data_into_db(self):
        print('Pushing')

    def insert_wall_posts_into_DB(self,config):
        wall_items_list=self.wall_posts.get('items')

        for i in range(0, min(len(wall_items_list),100,int( config["wallposts"]["maxPosts"]))):
            CRUD.add_wall_post_into_db(self.user_id, wall_items_list[i])
            try:
                commentary_list= self.vk_api.wall.getComments(owner_id=self.user_id,post_id=wall_items_list[i].get('id'),v=self.version,thread_items_count=config["comments"]["maxThreadItems"])
            except vk.exceptions.VkAPIError as e:
                print('ErrorCode: '+str(e.code))
                print(e)
                return False
            time.sleep(1)

            self.add_new_comment_into_DB(wall_items_list[i].get('id'),commentary_list,config)
            if (self.insert_post_liked_users(wall_items_list[i].get('id'))==False):
                return False
            self.insert_post_reposted_users(wall_items_list[i].get('id'))

        return True

    def add_new_comment_into_DB(self,wallpost_id,commetary_list,config):
        comments=commetary_list.get('items')
        if comments is None:
            return
        for i in range (0,min(20,int(config["comments"]["maxComments"]),len(comments))):
             CRUD.add_comment_into_db(self.user_id,wallpost_id,comments[i])
             self.insert_comment_liked_users(wallpost_id,comments[i].get('id'))
             if (comments[i].get('thread') is not None):
                self.add_new_comment_into_DB(wallpost_id, comments[i].get('thread'), config)

    def insert_post_liked_users(self,wallpost_id):
        liked_users_list=self.vk_api.likes.getList(type='post', owner_id=self.user_id, item_id=wallpost_id,v=self.version)
        time.sleep(1)
        if (len(liked_users_list.get('items'))>0):
            CRUD.insert_user_liked_post(liked_users_list.get('items'), self.user_id, wallpost_id)
            return True
        return False

    def insert_comment_liked_users(self,wallpost_id,comment_id):
        liked_users_list=self.vk_api.likes.getList(type='comment', owner_id=self.user_id, item_id=comment_id,v=self.version)
        time.sleep(1)
        if (len(liked_users_list.get('items')) > 0):
            CRUD.insert_user_liked_post_comment(liked_users_list.get('items'),self.user_id,wallpost_id,comment_id)
            return True
        return False

    def insert_post_reposted_users(self,wallpost_id):
        reposted_user_list=self.vk_api.wall.getReposts(owner_id=self.user_id, post_id=wallpost_id, v=self.version)
        time.sleep(1)
        if (len(reposted_user_list('items'))>0):
            CRUD.insert_user_reposted_post(reposted_user_list.get('items'), self.user_id, wallpost_id)
