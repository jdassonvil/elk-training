#!/usr/bin/python

import csv
import json

class Movie:
    def __init__(self, title, director, duration, country, rating):
        self.title = title
        self.director = director
        self.duration = None if not duration else int(duration)
        self.country = country
        self.rating = None if not rating else float(rating)

    def toString(self):
        return self.title + '|' + self.director + '|' + self.country + '|' + self.rating

    def toJSON(self):
        return json.dumps(self.__dict__, sort_keys=False)

with open('movie_metadata.csv', 'rb') as csvfile:
  csvfile = csv.reader(csvfile, delimiter=',')
  movies = []
  jsonFile = open('movie_metadata.json', 'w')
  bulkFile = open('movie_metadata.bulk', 'w')

  for row in csvfile:
      movie = Movie(row[11], row[1], row[3], row[20], row[25])
      movies.append(movie.__dict__)
      bulkFile.write('{"create" : { "_index" : "movies", "_type" : "movie"}}\n')
      bulkFile.write(movie.toJSON() + '\n')

  bulkFile.close()
  jsonFile.write(json.dumps(movies, sort_keys=False, indent=4, separators=(',', ': ')))
  jsonFile.close()
