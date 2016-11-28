# First steps with ELK training

TODO architecture diagram here

## Environment setup

You have several options to get a working environment for this training.

* Use the docker-compose file in `/env`, this requires docker installed on your machine
```
$ docker-compose up
```
* Use the vagrant file, this requires vagrant and VirtualBox or VMWare installed on your machine
* Install logstash, elasticsearch and kibana by following the instrcution from the vendor website

## Step 1: log processing with logstash
Logstash is a log processing application. Logstash role is to collect raw data from various sources, eventually
apply transformation and store it into a backend store. 

In the /datasets/uber directory you will find a dataset and a python script to stream it to logstash.

```
$ cd datasets/uber
with docker
$ docker build -t dataset-streamer -f streamer.dockerfile . 
$ docker run --net=host --rm --name python-streamer dataset-streamer
without docker (requires python installed)
$ nohup python stream.py &
```

You can then watch the log processing output in the logs
```
docker logs -f elktraining_logstash_1
or without docker
tail -f /var/log/logstash/*
```

## Step 2: storage and indexing within elastic search

## Step 3: data exploration with kibana

TODO Kibana screenshot here
