## ELK basic training

### Step 1: Initial setup
You have 3 options:
* If you have docker and docker-compose installed on your machine, clone this repository and run `docker-compose up`
* If you have virtualbox installed on your machine, close this repository and run `vagrant up` in the `vagrant` repository
* If you don't have any of those or if you don't want to use your own machine, a cloud hosted VM will be provided to you
during the training

To ensure you have proper initial setup, open a web browser and access the kibana UI at `:5601`

### Step 2: Basic understanding of elasticsearch

1. Using Postman or curl insert document in the movies index

  ```
  $ curl -X POST --data '{title: "Star Wars", director "George Lucas", year: "1977"}' http://localhost:9200/movies/movie/1
  ```

1. Now retrieve this document from the movie index using the _search API:

  ```
  $ curl http://localhost:9200/movies/_search
  ```

1. Add more document to the index so you can use the capabilities of the _search API to make more complex search. 

### Step 3: Indexation through logstash

1. Take a look at the `conf/logstash/logstash-uber.conf` file to understand the input format
1. Try to push manually a log entry
```
telnet localhost 5000
"16/1/2016 2:33:00",40.7445,-73.9855,"B02512"
```
1. If you have an eye on the logs you should see that your message has been processed by Logstash

### Step 4: Kibana basics

1. Define an index mapping in Kibana

1. Explore the discover view to browse and filter

1. Build a simple view

### Step 5: Working with a real dataset

1. Use the `streamer.py` script to stream the entire data set through logstash 
1. Browse the discover view
1. Use the `dashboard/uber/upload.sh' script to upload the dashboards
1. Browse the dashboard and check the existing views

### Step 6: Adding an extra view

1. Now it's time to work ! Try to add a weekly breakdown of ride pickup by time period 
