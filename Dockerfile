FROM python:3.10.5-slim

RUN apt update \
    && apt install python3-dev libpq-dev gcc -y \
    && apt install mc vim -y

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1



RUN mkdir /opt/src
WORKDIR /opt/src

COPY requirements .
RUN pip install --upgrade pip
RUN pip install -r requirements
RUN rm -f requirements

COPY src .

EXPOSE 8090

