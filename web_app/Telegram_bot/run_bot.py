
from web_app.Telegram_bot.Message_handler import Message_Handler
from multiprocessing import Process
import subprocess
import sys



if __name__=='__main__':
    message_handler = Message_Handler()
    subprocess.Popen([sys.executable, './Telegram_bot/bot.py'])
    p1 = Process(target=message_handler.recieving_messages, args=())
    p1.start()
    p1.join()
