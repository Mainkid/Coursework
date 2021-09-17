import pika
import time
import json
import configparser
from DB_Operations.Collector.User_message import User_message

class Message_Handler:
    host = 0
    port = 0

    def __init__(self):
        self.self_init()

    def self_init(self):
        config = configparser.ConfigParser()  # создаём объекта парсера
        config.read(r"db_config.ini")  # читаем конфиг
        if (config['docker']['using_docker'] == '1'):
            self.host = config["rabbitmq_docker"]["host"]
            self.port = config["rabbitmq_docker"]["port"]
        else:
            self.host = config["rabbitmq"]["host"]
            self.port = config["rabbitmq"]["port"]

    def get_message_from_web(self, user_query, service_msg):
        self.self_init()
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host=self.host))
        channel = connection.channel()
        channel.queue_declare(queue='service', durable=True)
        channel.basic_qos(prefetch_count=1)
        channel.basic_consume(on_message_callback=lambda ch, method, properties, body: self.callback(body, user_query,ch,method),
                              queue='service')
        channel.start_consuming()
        while True:
            time.sleep(5)

    def callback(self,body, user_query,ch, method):
        if len(user_query)<1:
            ch.basic_ack(delivery_tag = method.delivery_tag)
            data = json.loads(body)
            user_query.append(User_message(data['user_id'],data['rec_depth']))
        time.sleep(2)
        #print('Recieved')

    def send_service_message(self,service_msg, user_batch_query):
        while True:
            while len(service_msg)>0:
                msg=service_msg[0]
                del service_msg[0]
                self.send_message(msg,'stat_query')
                print("==STATS SEND==")
            while len(user_batch_query)>0:
                data = {
                    "user_id": user_batch_query[0].user_id,
                    "rec_depth": user_batch_query[0].rec_depth
                }
                msg = json.dumps(data)
                del user_batch_query[0]
                self.send_message(msg, 'hello')
            time.sleep(5)

    def send_message(self,msg,queue_name):
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host=self.host))
        channel = connection.channel()
        channel.basic_publish(exchange='',
                              routing_key=queue_name,
                              body=msg, properties=pika.BasicProperties(
                delivery_mode=2,  # make message persistent
            ))
        connection.close()

    def get_msg(self,query_name):
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host=self.host))
        channel = connection.channel()
        channel.queue_declare(queue=query_name, durable=True)
        channel.basic_qos(prefetch_count=1)
        method_frame, header_frame, body = channel.basic_get(queue = query_name)
        if method_frame!=None:
            if method_frame.NAME == 'Basic.GetEmpty':
                connection.close()
                return ""
            else:
                channel.basic_ack(delivery_tag=method_frame.delivery_tag)
                connection.close()
        else:
            connection.close()
            return ""
        return body