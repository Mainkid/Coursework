import pika
import json
import time
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.exc import IntegrityError
from web_app.web_DB.entities.Stats import Stats
from web_app.web_DB.entities.Tokens import Tokens
from web_app.web_DB.startDB import startDB
import configparser


class Message_Handler:

    host = 0
    port = 0


    def __init__(self):
        config = configparser.ConfigParser()  # создаём объекта парсера
        config.read(r"web_db_config.ini")  # читаем конфиг
        if (config['docker']['using_docker'] == '1'):
            self.host = config["rabbitmq_docker"]["host"]
            self.port = config["rabbitmq_docker"]["port"]
        else:
            self.host = config["rabbitmq"]["host"]
            self.port = config["rabbitmq"]["port"]


    def send_message_to_node(self,user_id,rec_depth):
        data = {
            "user_id": user_id,
            "rec_depth": rec_depth
        }
        msg=json.dumps(data)
        self.send_message(msg,'hello')
        print('web_delivery')

    def recieving_messages(self):
        startDB.connect()
        self.put_tokens_to_query()
        connection = pika.BlockingConnection(pika.ConnectionParameters(
                host=self.host))

        channel = connection.channel()
        channel.queue_declare(queue='stat_query', durable=True)
        channel.basic_qos(prefetch_count=1)
        channel.basic_consume(
            on_message_callback=lambda ch, method, properties, body: self.callback(body, ch, method),
            queue='stat_query')
        channel.start_consuming()
        return

    def callback(self, body, ch, method):
        ch.basic_ack(delivery_tag=method.delivery_tag)
        print('BODY MSG: ', str(body))
        if str(body.decode("utf-8") )=='OK':
            try:
                x = startDB.session.query(Stats).get(1)
                print(x.successfully)
                x.successfully += 1
                startDB.session.commit()
            except:
                startDB.session.rollback()
            print('OK')
        elif str(body.decode("utf-8") )=='FAIL':
            try:
                x = startDB.session.query(Stats).get(1)
                x.failed += 1
                startDB.session.commit()
            except:
                startDB.session.rollback()
            print('Fail')
        elif str(body.decode("utf-8") )=='give_me_tokens':
            self.put_tokens_to_query()
        time.sleep(5)

    def send_message_token(self,file_bytes):
        return

    def send_message_id(self,file_bytes):
        try:
            text=file_bytes.decode('utf-8')
            userdata_list=text.split('\r\n')
            for userdata in userdata_list:
                user=userdata.split(':')
                self.send_message_to_node(user[0],user[1])
        except:
            print('ERROR occured while sending id!')

    def send_message(self,msg,channel_name):
        print(self.host)

        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host=self.host))

        channel = connection.channel()
        channel.queue_declare(queue=channel_name, durable=True)
        channel.basic_publish(exchange='',
                              routing_key=channel_name,
                              body=msg, properties=pika.BasicProperties(
                delivery_mode=2,  # make message persistent
            ))
        #connection.close()

    def put_tokens_to_query(self):
        try:
            get_token_by_query = startDB.session.query(Tokens.token).all()
            for token in get_token_by_query:
                self.send_message(token[0], 'token_query')
        except IntegrityError as err:
            return
        except SQLAlchemyError as err:
            return
