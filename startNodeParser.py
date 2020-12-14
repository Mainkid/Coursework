from Collector import vk_parser_Node
import time
# Скрипт для запуска одного собирателя!!!

if (__name__ == '__main__'):
    NewParser = vk_parser_Node.Node_Parser(False)  # Создание экземпляра парсера
    NewParser.startSession()  # Старт сессии
    for i in range (308211030, 308211100):
        NewParser.startPullingData(15594498)
        time.sleep(5)

