from DB_Operations.entities.Base import Base
from DB_Operations.entities.User import User
from DB_Operations.entities.Counters import Counters
from DB_Operations.entities.Career import Career
from DB_Operations.startDB import session
from DB_Operations.entities.User_connections import User_connections
from DB_Operations.entities.User_university import User_university
from DB_Operations.entities.User_friends import User_friends
from DB_Operations.entities.Unit import Unit
from DB_Operations.entities.User_military import User_military
from DB_Operations.entities.User_relatives import User_relatives
from DB_Operations.entities.User_school import User_school
from DB_Operations.entities.User_wall_posts import User_wall_posts
from DB_Operations.entities.User_occupation import User_occupation
from DB_Operations.entities.Wall_post_attachments import Wall_post_attachments
from DB_Operations.entities.Object_comments import Object_comments
from DB_Operations.entities.Object_comment_attachments import Object_comment_attachments
from DB_Operations.entities.Object_liked import Object_liked
from DB_Operations.entities.Object_comment_liked import Object_comment_liked
from DB_Operations.entities.Wall_post_reposted import Wall_post_reposted
from DB_Operations.entities.User_photos import User_photos

from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.query import sql
from sqlalchemy.orm import relation
from sqlalchemy.exc import IntegrityError

class CRUD:


    @staticmethod
    def insert_user_into_table(user_data):
        new_user= User(user_data)
        new_user_counters=Counters(user_data)
        session.add(new_user)
        session.add(new_user_counters)
        CRUD.insert_career_into_table(user_data)
        CRUD.insert_university_into_table(user_data)
        CRUD.insert_military_into_table(user_data)
        CRUD.insert_relatives_into_table(user_data)
        CRUD.insert_schools_into_table(user_data)
        CRUD.insert_occupation_into_table(user_data)

            #session.commit()



    @staticmethod
    def insert_occupation_into_table(user_data):
        occupation=user_data.get('occupation')
        user_id=user_data.get('id')
        if(occupation is None):
            return
        new_occupation=User_occupation(user_id,occupation)
        session.add(new_occupation)




    @staticmethod
    def insert_career_into_table(user_data):
        careerList= user_data.get('career')
        user_id=user_data.get('id')
        if (careerList is None):
            return
        for i in range(0,len(careerList)):
            new_career=Career(user_id,i,careerList[i])
            session.add(new_career)
        #session.commit()

    @staticmethod
    def insert_user_connections_into_table(user_data):
        #Доработать
        return 0

    @staticmethod
    def insert_university_into_table(user_data):
        universityList = user_data.get('universities')
        user_id = user_data.get('id')
        if (universityList is None):
            return
        for i in range (0,len(universityList)):
            new_university = User_university(user_id, i, universityList[i])
            session.add(new_university)
        #session.commit()

    @staticmethod
    def insert_friends_into_table(user_id,friends_data,offset,user_query):
        items=friends_data.get('items')
        if (items is None):
            return
        for i in range(offset, len(items)):
            new_friend=User_friends(user_id, items[i])
            user_query.append(items[i])
            session.add(new_friend)
        #session.commit()

    @staticmethod
    def insert_military_into_table(user_data):
        militaryList = user_data.get('military')
        user_id = user_data.get('id')
        if militaryList is None:
            return
        for i in range (0,len(militaryList)):
            new_military = User_military(user_id, i, militaryList[i])
            if (not CRUD.check_military_id_in_table(new_military.unit_id)):
                CRUD.add_military_id_into_table(militaryList[i].get('unit_id'), militaryList[i].get('unit'))
            session.add(new_military)
        # session.commit()

    @staticmethod
    def check_military_id_in_table(military_id):
        session.query(Unit)
        try:
            get_military_by_query= session.query(Unit.unit_id).filter(Unit.unit_id==military_id).one()
            if get_military_by_query.id == military_id:
                return True
            else:
                return False
        except IntegrityError as err:
            print(err)
            return False
        except SQLAlchemyError as err:
            if (err=='No row was found for one()'):
                return False
            else:
                print(err)

    @staticmethod
    def add_military_id_into_table(military_id, title):
        new_unit=Unit(military_id,title)
        session.add(new_unit)
        #session.commit()

    @staticmethod
    def insert_relatives_into_table(user_data):
        relativeList = user_data.get('relatives')
        user_id = user_data.get('id')
        if relativeList is None:
            return
        for i in range(0, len(relativeList)):
            new_relative = User_relatives(user_id, i, relativeList[i])
            session.add(new_relative)
        # session.commit()

    @staticmethod
    def insert_schools_into_table(user_data):
        schoolList = user_data.get('schools')
        user_id = user_data.get('id')
        if schoolList is None:
            return
        for i in range(0, len(schoolList)):
            new_school = User_school(user_id, i, schoolList[i])
            session.add(new_school)
        # session.commit()

    @staticmethod
    def check_user_in_db(checked_id):
        session.query(User)
        try:
            get_user_id = session.query(User.id).filter(User.id == checked_id).one()
            if get_user_id.id == checked_id:
                return True
            else:
                return False
        except IntegrityError as err:
            print(err)
            return False
        except SQLAlchemyError as err:
            if (err == 'No row was found for one()'):
                return False
            else:
                print(err)

    @staticmethod
    def add_wall_post_into_db(user_id, wallpost):
        new_wallpost=User_wall_posts(user_id, wallpost)
        CRUD.add_attachment_into_db(user_id,new_wallpost.id_wallpost,wallpost.get('attachments'))

        session.add(new_wallpost)

    @staticmethod
    def add_attachment_into_db(user_id, wallpost_id, attachment_list):
        if attachment_list is None:
            return
        for i in range (0,len(attachment_list)):
            a_type=attachment_list[i].get('type')
            url=CRUD.get_attachment_url(attachment_list[i], a_type)
            new_attachment=Wall_post_attachments(user_id,i,wallpost_id,attachment_list[i].get('type'), url)
            session.add(new_attachment)

    @staticmethod
    def add_object_attachment_into_db(user_id,id_comment, wallpost_id, attachment_list, object_type):
        if attachment_list is None:
            return
        for i in range(0, len(attachment_list)):
            a_type = attachment_list[i].get('type')
            url = CRUD.get_attachment_url(attachment_list[i], a_type)
            new_attachment = Object_comment_attachments(user_id,id_comment, i, wallpost_id, attachment_list[i].get('type'), url,object_type)
            session.add(new_attachment)

    @staticmethod
    def add_object_comment_into_db(user_id, wallpost_id, comment, object_type):
        new_Comment=Object_comments(user_id,wallpost_id,comment,object_type)
        CRUD.add_object_attachment_into_db(user_id,comment.get('id'),wallpost_id,comment.get('attachments'),object_type)
        session.add(new_Comment)
        return

    @staticmethod
    def commit_adding_user():
        session.commit()

    @staticmethod
    def rollback_session():
        session.rollback()

    @staticmethod
    def get_attachment_url(attachment,type_of_attachment):
        attachment=attachment.get(type_of_attachment)
        if (type_of_attachment == 'photo' or type_of_attachment == 'profile_photo'):
            sizes_array=attachment.get('sizes')
            return sizes_array[len(sizes_array)-1].get('url')
        elif (type_of_attachment == 'audio'):
            return attachment.get('url')
        elif (type_of_attachment== 'video'):
            return attachment.get('access_key')
        elif (type_of_attachment=='doc'):
            return attachment.get('url')
        elif (type_of_attachment=='graffiti'):
            return attachment.get('photo_604')
        elif (type_of_attachment=='link'):
            return attachment.get('url')
        elif(type_of_attachment=='note'):
            return attachment.get('view_url')
        elif(type_of_attachment=='page'):
            return attachment.get('id')
        elif(type_of_attachment=='album'):
            arr=attachment.get('thumb').get('sizes')
            return arr[len(arr)-1].get('url')
        elif(type_of_attachment=='market'):
            return attachment.get('url')
        elif(type_of_attachment=='sticker'):
            arr=attachment.get('images')
            return arr[len(arr)-1].get('url')
        else:
            return ''

    @staticmethod
    def insert_user_liked_object(user_liked_list,id,object_id,object_type):
        for i in range (0,len(user_liked_list)):
            new_liked=Object_liked(id,object_id,user_liked_list[i],object_type)
            session.add(new_liked)

    @staticmethod
    def insert_user_liked_object_comment(user_liked_list,id,object_id,comment_id,object_type):
        for i in range (0,len(user_liked_list)):
            new_liked=Object_comment_liked(id,object_id,user_liked_list[i], comment_id,object_type)
            session.add(new_liked)

    @staticmethod
    def insert_user_reposted_post(user_reposted_list,id,wallpost_id):
        for i in range (0,len(user_reposted_list)):
            new_reposted=Wall_post_reposted(id,wallpost_id,user_reposted_list[i])
            session.add(new_reposted)

    @staticmethod
    def insert_user_photo_data(id, photo):
        new_photo=User_photos(id, photo)
        session.add(new_photo)

