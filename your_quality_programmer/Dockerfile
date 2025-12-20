FROM python:3.14-slim

### 1. Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN mkdir /code
COPY . /code/
WORKDIR /code

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

EXPOSE 8000