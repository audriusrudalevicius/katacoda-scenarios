# Build docker image

## Build image

This will build docker image and tag as *example_counter*

`docker build -t example_counter .`{{execute}}

Docker run to test it works

`docker run -it --rm example_counter`{{execute}}

Ctrl+c to kill and exit

## Deploy to docker registry

Will tag and publish image to local registry so kubernetes cluster can access it later

`docker tag example_counter localhost:5000/example_counter`{{execute}}

`docker push 'localhost:5000/example_counter'`{{execute}}
