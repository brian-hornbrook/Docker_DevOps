FROM python:3.14-slim

### 1. Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN useradd -m appuser
USER appuser
RUN mkdir ~/code


#RUN mkdir /code
#COPY ./your_quality_programmer /code/
#WORKDIR /code

# RUN python3 -m venv env

#RUN pip install --upgrade pip \
#    && pip install -r requirements.txt

EXPOSE 8000