FROM python:3.6

RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/app/DB_Operations
RUN mkdir -p /usr/src/app/Collector
RUN mkdir -p /usr/src/app/webApp
RUN pip install psycopg2
RUN pip install sqlalchemy
RUN pip install flask
RUN pip install vk
WORKDIR /usr/src/app/DB_Operations

COPY . /usr/src/app/DB_Operations/

EXPOSE 5432

CMD ["python","startNodeParser.py"]