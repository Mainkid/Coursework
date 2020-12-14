import vk
from Collector import data_collector


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
            self.token = '0d33c9280858a27d8f5a42f448f918f878a88c3d142a35246bbfc6f3fe34a2929dbbafec0d4144a55c988'

    def startSession(self):
        session = vk.Session(access_token=self.token)  # Начинаем сессию
        self.vk_api = vk.API(session)

    def startPullingData(self, user_id):    #  Начинаем сбор данных
        print('Pulling data from ', user_id)
        collector = data_collector.Data_Collector(self.vk_api, self.version, user_id) #Создаем каждый раз новый экземпляр

