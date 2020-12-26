from Collector import vk_parser_Node
from Message_handler import Message_Handler
import time
from multiprocessing import Process
import pika
# Скрипт для запуска одного собирателя!!!

NewParser = vk_parser_Node.Node_Parser(False)  # Создание экземпляра парсера
NewParser.startSession()

user_query=[]


def start_collecting():
    while True:
        if len(user_query)>0:
            for i in range(len(user_query)):
                NewParser.startPullingData(i)
        time.sleep(5)



if (__name__ == '__main__'):
    # Старт сессии
    message_handler = Message_Handler(user_query)
    user_query
    p2 = Process(target=start_collecting)
    p2.start()
    p1 = Process(target=message_handler.get_message_from_web )
    p1.start()
    p2.join()
    p1.join()



