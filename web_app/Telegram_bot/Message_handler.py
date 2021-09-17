import pika
import time
import telebot
import configparser
from web_app.web_DB.startDB import startDB
from web_app.web_DB.entities.Telegram_id import Telegram_id
class Message_Handler:
    bot = telebot.TeleBot('1602230107:AAHSuqntjxTGXO734og9q6uXX_6cMXUrJPs')
    host=0
    port=0

    def __init__(self):
        config = configparser.ConfigParser()  # создаём объекта парсера
        config.read(r"web_db_config.ini")  # читаем конфиг
        if (config['docker']['using_docker']=='1'):
            self.host=config["rabbitmq_docker"]["host"]
            self.port=config["rabbitmq_docker"]["port"]
        else:
            self.host = config["rabbitmq"]["host"]
            self.port = config["rabbitmq"]["port"]
        print()


    def send_message_to_node(self,msg):
        self.send_message(msg,'from_telegram')
        print('web_delivery')

    def recieving_messages(self):
        startDB.connect()
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host=self.host, connection_attempts=10, heartbeat=60))
        channel = connection.channel()
        channel.queue_declare(queue='to_telegram', durable=True)
        channel.basic_qos(prefetch_count=1)
        channel.basic_consume(
            on_message_callback=lambda ch, method, properties, body: self.callback(body, ch, method),
            queue='to_telegram')
        channel.start_consuming()
        while True:
            time.sleep(5)

    def callback(self, body, ch, method):
        ch.basic_ack(delivery_tag=method.delivery_tag)
        try:
            res=startDB.session.query(Telegram_id.user).all()
            for user in res:
                self.bot.send_message(user[0], body)
        except:
            print('err')


    def send_message(self,msg,channel_name):
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host=self.host, connection_attempts=10, heartbeat=60))
        channel = connection.channel()
        channel.basic_publish(exchange='',
                              routing_key=channel_name,
                              body=msg, properties=pika.BasicProperties(
                delivery_mode=2,  # make message persistent
            ))
        connection.close()