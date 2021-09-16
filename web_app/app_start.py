from flask import Flask,render_template,request
from web_app.Web_server_operations import Web_server_operations
from web_app.User_view_class import User_view
from web_app.Message_handler import Message_Handler


from multiprocessing import Process
import multiprocessing
import time
#import web_app.web
import subprocess
import sys
import json
import pika
import configparser

def check_consumers():
    amount_of_consumers=0
    config = configparser.ConfigParser()  # создаём объекта парсера
    config.read(r"web_db_config.ini")

    while True:
        if(config["docker"]["using_docker"]=='1'):
            print('123', config["rabbitmq_docker"]["host"])
            command = 'curl -i -u guest:guest http://rabbitmq_query:15672/api/queues/'
        else:
            command = 'curl -i -u guest:guest http://127.0.0.1:15672/api/queues/'
        proc = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
        script_response = proc.stdout.read().decode("utf-8").split('\r\n')
        queues_info = json.loads(script_response[9])
        for queue in queues_info:
            try:
                if queue.get('name')=='service':
                    if queue.get('consumers')>amount_of_consumers:
                        amount_of_consumers=queue.get('consumers')
                        print('Some new consumers appeared!')
                    elif queue.get('consumers')<amount_of_consumers:
                        message_handler.send_message('Oops, seems to be that one of the nodes is down. Current amount of active nodes: '+(str)(queue.get('consumers')),'to_telegram')
                        amount_of_consumers =queue.get('consumers')
                        print('Oops')
            except:
                print('EXCEPTION!')
        time.sleep(10)


message_handler=Message_Handler()
if __name__=='__main__':

    time.sleep(30)
    #p2 = Process(target=check_consumers, args=())
    #p2.start()
    p1 = Process(target=message_handler.recieving_messages, args=())
    p1.start()
    theproc1 = subprocess.Popen([sys.executable, "./Telegram_bot/run_bot.py"])
    theproc = subprocess.Popen([sys.executable, "web.py"])
    theproc.communicate()

    #p2.join()
    p1.join()


