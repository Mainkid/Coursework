import telebot
from web_app.web_DB.entities.Telegram_id import Telegram_id
from web_app.web_DB.startDB import startDB
from web_app.Telegram_bot.Message_handler import Message_Handler
from sqlalchemy.exc import SQLAlchemyError
bot = telebot.TeleBot('1602230107:AAGcqmmLQN0zAvaSIBBk9mHtAKQQVUoqWhY')



message_handler=Message_Handler()

@bot.message_handler(content_types=['text'])
def get_text_messages(message):
    if message.text == "Привет":
        bot.send_message(message.from_user.id, "Привет, чем я могу тебе помочь?")
    elif message.text == "/help":
        bot.send_message(message.from_user.id, "Привет, я бот! Зарегистрируйтесь (/register), чтобы решать каптчи и получать сообщения о сбоях в узлах.")
    elif message.text=='/register':
        if check_in_DB(message.from_user.id):
            bot.send_message(message.from_user.id, 'Похоже, что вы уже зарегистрировались!')
        else:
            add_user_into_DB(message.from_user.id)
            bot.send_message(message.from_user.id,'Вы успешно зарегистированы!')
    else:
        bot.send_message(message.from_user.id, "Я тебя не понимаю. Напиши /help.")


def check_in_DB(user_id):
    startDB.session.query(Telegram_id)
    try:
        user_id = startDB.session.query(Telegram_id.user).filter(Telegram_id.user == user_id).one()
        return True
    except SQLAlchemyError as err:
        if (err == 'No row was found for one()'):
            return False
        else:
            print(err)
            return False

def add_user_into_DB(user_id):
    new_user=Telegram_id(user_id)
    startDB.session.add(new_user)
    startDB.session.commit()


startDB.connect()
bot.polling(none_stop=True, interval=0)
