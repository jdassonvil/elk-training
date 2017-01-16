#!/usr/bin/python

import csv
import json

class Movie:
    def __init__(self, title, director, duration, country, rating):
        self.title = title
        self.director = director
        self.duration = duration
        self.country = country
        self.rating = rating

    def toString(self):
        return self.title + '|' + self.director + '|' + self.country + '|' + self.rating

    def toJSON(self):
        return json.dumps(self.__dict__, sort_keys=False)

with open('movie_metadata.csv', 'rb') as csvfile:
  csvfile = csv.reader(csvfile, delimiter=',')
  movies = []
  for row in csvfile:
      movie = Movie(row[11], row[1], row[3], row[20], row[25])
      movies.append(movie.__dict__)

  print json.dumps(movies, sort_keys=False, indent=4, separators=(',', ': '))
