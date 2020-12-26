import pika
#from startNodeParser import user_query

class Message_Handler:



    def __init__(self,user_query):
        print()



    def get_message_from_web(self):
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host='localhost'))
        channel = connection.channel()
        channel.queue_declare(queue='hello')
        channel.basic_consume(on_message_callback=self.callback, queue='hello')
        channel.start_consuming()

    def callback(self, ch, method, properties, body):
        self.user_query.append(int(body))
        print(" [x] Received %r" % (body,))