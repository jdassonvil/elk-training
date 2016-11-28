#!/usr/bin/python

import csv
import socket
import time
from datetime import datetime

LOGSTASH_IP = '127.0.0.1'
LOGSTASH_PORT = 5000
DATE_FORMAT = '%m/%d/%Y %H:%M:%S'
LOG_PER_SECOND = 100.0

now = datetime.now()
month = 12 if now.month == 1 else now.month - 1
year =  now.year - 1 if month == 12 else now.year

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((LOGSTASH_IP, LOGSTASH_PORT))

def get_timeperiod(hour):
  if hour >= 2 and hour < 6:
    return 'late night'
  if hour >= 6 and hour < 10:
    return 'morning'
  if hour >= 10 and hour < 14:
    return 'midday'
  if hour >= 14 and hour < 18:
    return 'afternoon'
  if hour >= 18 and hour < 22:
    return 'early night'
  if hour >= 22 or hour < 2:
    return 'midnight'

  return 'unknown'

def to_csv(row, dayofweek, timeperiod):
  return '"{}",{},{},"{}",{},{}\n'.format(row[0], row[1], row[2], row[3], dayofweek, timeperiod)

with open('uber-raw-data-sep14.csv', 'rb') as csvfile:
  csvfile = csv.reader(csvfile, delimiter=',')
  for row in csvfile:
    csvdate = datetime.strptime(row[0], DATE_FORMAT )
    row[0] = datetime(year, month, csvdate.day, csvdate.hour, csvdate.minute, csvdate.second).strftime(DATE_FORMAT)
    s.send(to_csv(row, csvdate.strftime("%w"), get_timeperiod(csvdate.hour)))
    time.sleep(1.0/LOG_PER_SECOND)
