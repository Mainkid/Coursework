import vk
from DB_Operations.Collector.data_collector import Data_Collector
from DB_Operations.Message_handler import Message_Handler
import time

class Node_Parser:
    vk_api:vk.API
    token = ""
    version = 5.126



    def get_token(self):
        counter=0
        while self.token=="":
            if counter<10:
                message_handler = Message_Handler()
                self.token = message_handler.get_msg('token_query')
                print('Trying to get token from server...')
                time.sleep(5)
                counter+=1
            else:
                print('OK, lets get some tokens from DB...')
                message_handler.send_message('give_me_tokens','stat_query')
                counter=0


    def __init__(self, is_new_user):
        self.get_token()
        print('Token accepted!')

    def startSession(self):
        message_handler = Message_Handler()
        session_has_started=False
        while not session_has_started:
            try:
                session = vk.Session(access_token=self.token)  # Начинаем сессию
                self.vk_api = vk.API(session)
                session_has_started=True

            except:
                print('Oops, seems to be a problem with authorisation... trying to change a token.')
                message_handler.send_message(self.token,'token_query')
                self.get_token()


    def startPullingData(self, user_id,rec_depth,user_query,service_msg, user_batch_query):    #  Начинаем сбор данных
        print('Pulling data from ', user_id)
        collector = Data_Collector(self.vk_api, self.version, user_id, user_batch_query,rec_depth,service_msg) #Создаем каждый раз новый экземпляр

