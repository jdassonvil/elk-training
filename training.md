## ELK basic training

### Step 1: Basic understanding of elasticsearch



1. Using Postman or curl insert document in the movies index

  ```
  $ curl -X POST --data '{title: "Star Wars", director "George Lucas", country: "usa", year: "1977", duration: 140, rating: 8.2}' http://localhost:9200/movies/movie/1
  ```

1. You can now retrieve this document from the movie index using the _search API:

  ```
  $ curl http://localhost:9200/movies/_search
  ```

1. A single document is not a funny case of study... Let's add more document to the index ! You can do it manually or
can use the bulk API to insert a whole dataset to the index.
  ```
  $ curl -X POST --data-binary @datasets/imdb/movie_metadata.bulk http://localhost:9200/movies/movie/_bulk 
  ```

1. Now try to make more complex request:
  1. List all movies from a director named George

### Step 2: Kibana basics

1. Connect to the Kibana web UI at `localhost:5601`
1. The first time you get connected you will to define an index mapping. Fill in *movies* as pattern and untick the
checkbox *Index contains time-based event*.
1. From the discover view you can browse your dataset like you did using the _search API
1. Now let's use the real power of Kibana. Click on the "Visualize" tab and try to build some visualisation !
  1. Average duration of movies
  1. Rating Distribution
  1. Average rating depending on the year
  1. Production share by country
  1. Top 10 of the countries that have the best rating average
1. Finally wrap all your visualiation into a single dashboard

### Step 4: Indexation through logstash

1. Take a look at the `conf/logstash/logstash-uber.conf` file to understand the input format
1. Try to push manually a log entry
```
telnet localhost 5000
"16/1/2016 2:33:00",40.7445,-73.9855,"B02512"
```
1. If you have an eye on the logs you should see that your message has been processed by Logstash


### Step 5: Working with a real dataset

1. Use the `streamer.py` script to stream the entire data set through logstash 
  ```
  $ python datasets/uber/streamer.py
  ```
1. Browse the discover view
1. Use the `dashboard/uber/upload.sh' script to upload the dashboards
1. Browse the dashboard and check the existing views

### Step 6: Adding an extra view

1. Now it's time to work ! Try to add a weekly breakdown of ride pickup by time period 
