import pika
import json

class Message_Handler:




    def __init__(self):
        self.connection = pika.BlockingConnection(pika.ConnectionParameters(
            'localhost'))
        self.channel = self.connection.channel()
        self.channel.queue_delete(queue='hello')
        self.channel.queue_declare(queue='hello', durable=True)
        print()


    def send_message_to_node(self,user_id,rec_depth):
        data = {
            "user_id": user_id,
            "rec_depth": rec_depth
        }
        msg=json.dumps(data)
        self.connection = pika.BlockingConnection(pika.ConnectionParameters(
            'localhost'))
        self.channel.basic_publish(exchange='',
                              routing_key='hello',
                              body=msg, properties=pika.BasicProperties(
                         delivery_mode = 2, # make message persistent
                      ))
        self.connection.close()