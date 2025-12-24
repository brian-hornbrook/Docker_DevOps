FROM python:3.14-slim

# set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV APPUSER_PASSWORD=$APPUSER_PASSWORD

# create app user
RUN useradd -m appuser
RUN usermod -aG sudo appuser
# RUN passwd $APPUSER_PASSWORD
USER appuser

# create app code
RUN mkdir /home/appuser/code
WORKDIR /home/appuser/code
COPY ./your_quality_programmer /home/appuser/code/

## create virtual environment
RUN cd && \
    python3 -m venv env && \
    pip install django==5.2.* gunicorn psycopg2-binary

EXPOSE 8000
