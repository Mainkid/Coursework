from Collector import vk_parser_Node
from DB_Operations.Message_handler import Message_Handler
import time
from multiprocessing import Process
import multiprocessing

# Скрипт для запуска одного собирателя!!!

NewParser = vk_parser_Node.Node_Parser(False)  # Создание экземпляра парсера
NewParser.startSession()




def start_collecting(user_query):
    while True:
        NewParser.startPullingData(11)
        while len(user_query)>0:
            NewParser.startPullingData(user_query[0].user_id)
            del user_query[0]
            time.sleep(0.5)

        time.sleep(5)


if (__name__ == '__main__'):
    # Старт сессии
    m = multiprocessing.Manager()
    user_query = m.list()
    message_handler = Message_Handler()
    p2 = Process(target=start_collecting, args=(user_query,))
    p2.start()
    p1 = Process(target=message_handler.get_message_from_web,args=(user_query,) )
    p1.start()
    p2.join()
    p1.join()



