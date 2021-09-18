from DB_Operations.Collector import vk_parser_Node
from DB_Operations.Message_handler import Message_Handler
from DB_Operations.startDB import startDB
import time
import json
from multiprocessing import Process

import multiprocessing

# Скрипт для запуска одного собирателя!!!



def start_collecting(user_query,service_msg, user_batch_query):
    startDB.connect()
    message_handler = Message_Handler()
    NewParser = vk_parser_Node.Node_Parser(False)  # Создание экземпляра парсера
    NewParser.startSession()
    f=1
    while True:
        msg = message_handler.get_msg('hello')
        if msg != "":
            data = json.loads(msg)
            NewParser.startPullingData(data['user_id'],int(data['rec_depth']), user_query, service_msg,user_batch_query)
            time.sleep(0.5)
        #time.sleep(5)


if (__name__ == '__main__'):
    # Старт сессии
    time.sleep(70)
    m = multiprocessing.Manager()
    user_batch_query=m.list()
    user_query = m.list()
    service_msg=m.list()
    user_batch_query2 = m.list()
    message_handler = Message_Handler()


    p2 = Process(target=start_collecting, args=(user_query,service_msg, user_batch_query), daemon=True)
    p2.start()
    p4 = Process(target=start_collecting, args=(user_query, service_msg, user_batch_query2))
    p4.start()
    p3 = Process(target=message_handler.send_service_message, args=(service_msg, user_batch_query,user_batch_query2))
    p3.start()
    p1 = Process(target=message_handler.get_message_from_web, args=(user_query, service_msg))
    p1.start()

    p2.join()






