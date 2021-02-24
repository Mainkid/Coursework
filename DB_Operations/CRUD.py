from DB_Operations.entities.Base import Base
from DB_Operations.entities.User import User
from DB_Operations.entities.Counters import Counters
from DB_Operations.entities.Career import Career
from DB_Operations.startDB import startDB
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
from DB_Operations.entities.City import City
from DB_Operations.entities.Country import Country
from DB_Operations.entities.Faculties import Faculties
from DB_Operations.entities.Universities import Universities
from DB_Operations.entities.Chairs import Chairs
from DB_Operations.Collector.User_message import User_message
import datetime

from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.query import sql
from sqlalchemy.orm import relation
from sqlalchemy.exc import IntegrityError

class CRUD:


    @staticmethod
    def insert_user_into_table(user_data):
        new_user= User(user_data)
        new_user_counters=Counters(user_data)
        startDB.session.add(new_user)
        startDB.session.add(new_user_counters)
        CRUD.insert_city_into_table(user_data)
        CRUD.insert_country_into_table(user_data)
        CRUD.insert_career_into_table(user_data)
        CRUD.insert_university_into_table(user_data)
        CRUD.insert_military_into_table(user_data)
        CRUD.insert_relatives_into_table(user_data)
        CRUD.insert_schools_into_table(user_data)
        CRUD.insert_occupation_into_table(user_data)

            #startDB.session.commit()

    @staticmethod
    def insert_city_into_table(user_data):
        if user_data.get('city') is None:
            return
        city_name = user_data.get('city').get('title')
        city_id = user_data.get('city').get('id')
        user_id = user_data.get('id')
        new_city = City(city_id, city_name)
        if (not CRUD.check_city_id_in_table(city_id)):
            startDB.session.add(new_city)

    @staticmethod
    def check_city_id_in_table(city_id):
        startDB.session.query(City)
        try:
            get_city_by_query = startDB.session.query(City.id_city).filter(City.id_city == city_id).one()
            if get_city_by_query.id_city == city_id:
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
    def insert_country_into_table(user_data):
        if user_data.get('country') is None:
            return
        country_name = user_data.get('country').get('title')
        country_id = user_data.get('country').get('id')
        user_id = user_data.get('id')
        new_country = Country(country_id, country_name)
        if (not CRUD.check_country_id_in_table(country_id)):
            startDB.session.add(new_country)

    @staticmethod
    def check_country_id_in_table(country_id):
        startDB.session.query(Country)
        try:
            get_country_by_query = startDB.session.query(Country.id_country).filter(Country.id_country == country_id).one()
            if get_country_by_query.id_country == country_id:
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
    def insert_occupation_into_table(user_data):
        occupation=user_data.get('occupation')
        user_id=user_data.get('id')
        if(occupation is None):
            return
        new_occupation=User_occupation(user_id,occupation)
        startDB.session.add(new_occupation)




    @staticmethod
    def insert_career_into_table(user_data):
        careerList= user_data.get('career')
        user_id=user_data.get('id')
        if (careerList is None):
            return
        for i in range(0,len(careerList)):
            new_career=Career(user_id,i,careerList[i])
            startDB.session.add(new_career)
        #startDB.session.commit()

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
            if (not CRUD.check_university_id_in_table(universityList[i])):
                CRUD.add_university_id_in_table(universityList[i])
            if (not CRUD.check_chair_id_in_table(universityList[i])):
                CRUD.add_chair_id_in_table(universityList[i])
            if (not CRUD.check_faculty_id_in_table(universityList[i])):
                CRUD.add_faculty_id_in_table(universityList[i])
            startDB.session.add(new_university)
        #startDB.session.commit()

    @staticmethod
    def check_chair_id_in_table(univer):
        chair_id = univer.get('chair')
        chair_name = univer.get('chair_name')
        if (chair_id is None):
            return True
        try:
            get_chair_by_query = startDB.session.query(Chairs.id_chair).filter(Chairs.id_chair == chair_id).one()
            if get_chair_by_query.id_chair == chair_id:
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
    def add_chair_id_in_table(univer):
        chair_id = univer.get('chair')
        chair_name = univer.get('chair_name')
        new_chair = Chairs(chair_id, chair_name)
        startDB.session.add(new_chair)

    @staticmethod
    def check_faculty_id_in_table(univer):
        faculty_id=univer.get('faculty')
        faculty_name=univer.get('faculty_name')
        if (faculty_id is None):
            return True
        try:
            get_faculty_by_query = startDB.session.query(Faculties.id_faculty).filter(Faculties.id_faculty == faculty_id).one()
            if get_faculty_by_query.id_faculty == faculty_id:
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
    def add_faculty_id_in_table(univer):
        faculty_id = univer.get('faculty')
        faculty_name = univer.get('faculty_name')
        new_faculty=Faculties(faculty_id,faculty_name)
        startDB.session.add(new_faculty)

    @staticmethod
    def check_university_id_in_table(university):
        university_id=university.get('id')
        startDB.session.query(Universities)
        try:
            get_university_by_query = startDB.session.query(Universities.id_university).filter(Universities.id_university == university_id).one()
            if get_university_by_query.id_university == university_id:
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
    def add_university_id_in_table(univer):
        title=univer.get('name')
        id=univer.get('id')
        if not CRUD.check_university_id_in_table(univer):
            new_univeristy=Universities(id,title)
            startDB.session.add(new_univeristy)


    @staticmethod
    def insert_friends_into_table(user_id,friends_data,offset, user_batch_query,rec_depth):
        if (rec_depth>0):
            items=friends_data.get('items')
            if (items is None):
                return
            for i in range(offset, len(items)):
                new_friend=User_friends(user_id, items[i])
                user_batch_query.append(User_message(items[i],rec_depth))
                startDB.session.add(new_friend)
        #startDB.session.commit()

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
            startDB.session.add(new_military)
        # startDB.session.commit()

    @staticmethod
    def check_military_id_in_table(military_id):
        startDB.session.query(Unit)
        try:
            get_military_by_query= startDB.session.query(Unit.unit_id).filter(Unit.unit_id==military_id).one()
            if get_military_by_query.unit_id == military_id:
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
        startDB.session.add(new_unit)
        #startDB.session.commit()

    @staticmethod
    def insert_relatives_into_table(user_data):
        relativeList = user_data.get('relatives')
        user_id = user_data.get('id')
        if relativeList is None:
            return
        for i in range(0, len(relativeList)):
            new_relative = User_relatives(user_id, i, relativeList[i])
            startDB.session.add(new_relative)
        # startDB.session.commit()

    @staticmethod
    def insert_schools_into_table(user_data):
        schoolList = user_data.get('schools')
        user_id = user_data.get('id')
        if schoolList is None:
            return
        for i in range(0, len(schoolList)):
            new_school = User_school(user_id, i, schoolList[i])
            startDB.session.add(new_school)
        # startDB.session.commit()

    @staticmethod
    def check_user_in_db(checked_id):
        print()
        startDB.session.query(User)
        try:
            get_user_id = startDB.session.query(User.id).filter(User.id == checked_id).one()
            if get_user_id.id == int(checked_id):
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

        startDB.session.add(new_wallpost)

    @staticmethod
    def add_attachment_into_db(user_id, wallpost_id, attachment_list):
        if attachment_list is None:
            return
        for i in range (0,len(attachment_list)):
            a_type=attachment_list[i].get('type')
            url=CRUD.get_attachment_url(attachment_list[i], a_type)
            new_attachment=Wall_post_attachments(user_id,i,wallpost_id,attachment_list[i].get('type'), url)
            startDB.session.add(new_attachment)

    @staticmethod
    def add_object_attachment_into_db(user_id,id_comment, wallpost_id, attachment_list, object_type):
        if attachment_list is None:
            return
        for i in range(0, len(attachment_list)):
            a_type = attachment_list[i].get('type')
            url = CRUD.get_attachment_url(attachment_list[i], a_type)
            new_attachment = Object_comment_attachments(user_id,id_comment, i, wallpost_id, attachment_list[i].get('type'), url,object_type)
            startDB.session.add(new_attachment)

    @staticmethod
    def add_object_comment_into_db(user_id, wallpost_id, comment, object_type, user_batch_query,rec_depth):
        new_Comment=Object_comments(user_id,wallpost_id,comment,object_type)
        if (comment.get('from_id')!=user_id and rec_depth!=0):
            user_batch_query.append(User_message(comment.get('from_id'),rec_depth))
        CRUD.add_object_attachment_into_db(user_id,comment.get('id'),wallpost_id,comment.get('attachments'),object_type)
        startDB.session.add(new_Comment)
        return

    @staticmethod
    def commit_adding_user():
        startDB.session.commit()

    @staticmethod
    def rollback_session():
        startDB.session.rollback()

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
            startDB.session.add(new_liked)

    @staticmethod
    def insert_user_liked_object_comment(user_liked_list,id,object_id,comment_id,object_type):
        for i in range (0,len(user_liked_list)):
            new_liked=Object_comment_liked(id,object_id,user_liked_list[i], comment_id,object_type)
            startDB.session.add(new_liked)

    @staticmethod
    def insert_user_reposted_post(user_reposted_list,id,wallpost_id):
        for i in range (0,len(user_reposted_list)):
            new_reposted=Wall_post_reposted(id,wallpost_id,user_reposted_list[i])
            startDB.session.add(new_reposted)

    @staticmethod
    def insert_user_photo_data(id, photo):
        new_photo=User_photos(id, photo)
        if not CRUD.check_user_photo_data(id,photo):
            startDB.session.add(new_photo)

    @staticmethod
    def check_user_photo_data(id,photo):
        startDB.session.query(User_photos)
        try:
            user_data = startDB.session.query(User_photos.id,User_photos.id_photo).filter(User_photos.id == id and photo==User_photos.id_photo).one()
            return True
        except IntegrityError as err:
            print(err)
            return False
        except SQLAlchemyError as err:
            if (err == 'No row was found for one()'):
                return False
            else:
                print(err,'!!!!!!!')
                return False

    @staticmethod
    def get_time(user_id):

        startDB.session.query(User)
        try:
            user_date = startDB.session.query(User.Date_of_Collection).filter(User.id == user_id).one()
            return user_date[0]
        except IntegrityError as err:
            print(err)
            return datetime.datetime.now()
        except SQLAlchemyError as err:
            if (err == 'No row was found for one()'):
                return datetime.datetime.now()
            else:
                print(err)
                return datetime.datetime.now()

    @staticmethod
    def clear_all_data(user_id):
        try:
            startDB.session.query(User).filter_by(id=user_id).delete()
            startDB.session.query(Career).filter_by(id=user_id).delete()
            startDB.session.query(Counters).filter_by(id=user_id).delete()
            startDB.session.query(Object_comment_attachments).filter_by(id=user_id).delete()
            startDB.session.query(Object_comment_liked).filter_by(id=user_id).delete()
            startDB.session.query(Object_comments).filter_by(id=user_id).delete()
            startDB.session.query(Object_liked).filter_by(id=user_id).delete()
            startDB.session.query(User_connections).filter_by(id=user_id).delete()
            startDB.session.query(User_friends).filter_by(id=user_id).delete()
            startDB.session.query(User_military).filter_by(id=user_id).delete()
            startDB.session.query(User_occupation).filter_by(id=user_id).delete()
            startDB.session.query(User_photos).filter_by(id=user_id).delete()
            startDB.session.query(User_relatives).filter_by(id=user_id).delete()
            startDB.session.query(User_school).filter_by(id=user_id).delete()
            startDB.session.query(User_university).filter_by(id=user_id).delete()
            startDB.session.query(User_wall_posts).filter_by(id=user_id).delete()
            startDB.session.query(Wall_post_attachments).filter_by(id=user_id).delete()
            startDB.session.query(Wall_post_reposted).filter_by(id=user_id).delete()
        except:
            print("Oops, there is no user with such id")