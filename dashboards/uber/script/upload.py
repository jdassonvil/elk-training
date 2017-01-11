#!/usr/bin/python

import requests
import json


if __name__ == '__main__':
    visualizations = json.loads(open('../visualisation.json').read())
    for visualization in visualizations:
        data = json.dumps(visualization['_source'])
        r = requests.post('http://localhost:9200/.kibana/visualization/%s' % visualization['_id'], data)
        print r.status_code
        print r.text


    dashboards = json.loads(open('../dashboard.json').read())
    for dashboard in dashboards:
        data = json.dumps(dashboard['_source'])
        r = requests.post('http://localhost:9200/.kibana/dashboard/%s' % dashboard['_id'], data)
        print r.status_code
        print r.text
