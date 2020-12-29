FROM python:3.6
COPY . usr/web_app
RUN pip install flask
RUN pip install pika
ENV PYTHONPATH /usr
WORKDIR usr/web_app/
ENV FLASK_APP=app_start.py
EXPOSE 5000
CMD ["python","app_start.py"]
