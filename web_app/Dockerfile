FROM python:3.6
COPY . usr/web_app
RUN pip install psycopg2
RUN pip install flask
RUN pip install pika
RUN pip3 install telebot
RUN pip install PyTelegramBotAPI
RUN pip install sqlalchemy
ENV PYTHONPATH /usr
WORKDIR usr/web_app/
ENV FLASK_APP=app_start.py
EXPOSE 5000
CMD ["python","app_start.py"]
