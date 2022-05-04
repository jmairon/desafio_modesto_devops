FROM python:3.7.3-slim
COPY requirements.txt /
RUN pip3 install -r /requirements.txt
COPY . /app
WORKDIR /app
RUN chmod 777 /app
EXPOSE 8000
ENTRYPOINT ["./gunicorn_starter.sh"]