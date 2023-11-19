FROM python:3.11.6

copy requirements.txt /tmp/.

RUN mkdir -p /usr/src

WORKDIR /usr/src

RUN pip install -r /tmp/requirements.txt

COPY src/. .
EXPOSE 5000

ENTRYPOINT python3 main.py