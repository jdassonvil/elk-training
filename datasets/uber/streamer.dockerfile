FROM python:2.7
ADD . /opt/streamer

WORKDIR /opt/streamer

CMD [ "python", "/opt/streamer/streamer.py" ]
