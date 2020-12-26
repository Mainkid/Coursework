import pika


class Message_Handler:




    def __init__(self):

        print()


    def send_message_to_node(self,msg):
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            'localhost'))
        channel = connection.channel()
        channel.queue_delete(queue='hello')
        channel.queue_declare(queue='hello')
        channel.basic_publish(exchange='',
                              routing_key='hello',
                              body=msg)