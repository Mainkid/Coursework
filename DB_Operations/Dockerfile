FROM python:3.6


RUN pip install psycopg2
RUN pip install sqlalchemy
RUN pip install flask
RUN pip install vk
RUN pip install pika
COPY . /usr/src/DB_Operations/
WORKDIR /usr/src/DB_Operations
ENV PYTHONPATH /usr/src

EXPOSE 5432

CMD ["python","startNodeParser.py"]