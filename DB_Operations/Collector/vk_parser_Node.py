import vk
from DB_Operations.Collector.data_collector import Data_Collector


class Node_Parser:
    vk_api:vk.API
    token = ""
    version = 5.126



    def __init__(self, is_new_user):
        # Если is_new_User==TRUE, тогда присвоить значению токена новые токен из tokenList, иначе взять любой токен
        if (is_new_user):
            # Новый токен
            return
        else:
            # Берем случайный токен || первый токен
            self.token = '1e95f60646ecbd7c77b29eb586c7bb3f3199167f4d4cafba52cbfa712aff8f732683c969b664b5cf32a39'

    def startSession(self):
        session = vk.Session(access_token=self.token)  # Начинаем сессию
        self.vk_api = vk.API(session)

    def startPullingData(self, user_id,user_query):    #  Начинаем сбор данных
        print('Pulling data from ', user_id)
        collector = Data_Collector(self.vk_api, self.version, user_id,user_query) #Создаем каждый раз новый экземпляр

