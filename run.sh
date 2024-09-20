#!/bin/bash

# Start MongoDB container
docker run -d --name mongodbcream -v ~/lab2/mongodb/init.js:/docker-entrypoint-initdb.d/init.js mongo

# Start Express container
docker build -t expresscream ~/lab2/express
docker run -d --name expresscream --link mongodbcream -p 3000:3000 expresscream

# Start Nginx container
docker run -d --name nginxcream -p 8080:80 -v ~/lab2/nginx/nginx.conf:/etc/nginx/nginx.conf -v ~/lab2/nginx/index.html:/usr/share/nginx/html/index.html nginx
