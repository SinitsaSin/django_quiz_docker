FROM python:3.10.5-slim

RUN apt update \
    && apt install python3-dev libpq-dev gcc -y \
    && apt install mc vim -y

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

ENV SECRET_KEY=django-insecure-pa&8&4io3x5ki@rtk-v28%i=+6p&7ap4v&=mp3c(jqn#zn8=-d
ENV DEBUG=True
ENV ALLOWED_HOSTS=''

RUN mkdir /opt/src
WORKDIR /opt/src

COPY requirements .
RUN pip install --upgrade pip
RUN pip install -r requirements
RUN rm -f requirements

COPY src .

EXPOSE 8090

CMD python manage.py runserver 0.0.0.0:8090