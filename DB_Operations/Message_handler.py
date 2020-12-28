import pika
import time
import json
from DB_Operations.User_message import User_message

class Message_Handler:



    def __init__(self):
        print()



    def get_message_from_web(self, user_query):
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host='localhost'))
        channel = connection.channel()
        channel.queue_declare(queue='hello', durable=True)
        channel.basic_qos(prefetch_count=1)
        channel.basic_consume(on_message_callback=lambda ch, method, properties, body: self.callback(body, user_query,ch,method),
                              queue='hello')
        channel.start_consuming()
        while True:
            time.sleep(5)

    def callback(self,body, user_query,ch, method):
        ch.basic_ack(delivery_tag = method.delivery_tag)
        data = json.loads(body)

        user_query.append(User_message(data['user_id'],data['rec_depth']))
        print(" [x] Received %r" % (body,) )