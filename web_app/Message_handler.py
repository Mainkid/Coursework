import pika
import json

class Message_Handler:




    def __init__(self):
        print()


    def send_message_to_node(self,user_id,rec_depth):
        data = {
            "user_id": user_id,
            "rec_depth": rec_depth
        }
        msg=json.dumps(data)
        connection = pika.BlockingConnection(pika.ConnectionParameters(
              'rabbitmq3'))
        channel = connection.channel()
        channel.basic_publish(exchange='',
                              routing_key='hello',
                              body=msg, properties=pika.BasicProperties(
                         delivery_mode = 2, # make message persistent
                      ))
        connection.close()
        print('web_delivery')