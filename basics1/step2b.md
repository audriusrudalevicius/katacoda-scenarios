# Deploy to docker registry

Will tag and publish image to local registry so kubernetes cluster can access it later

`docker tag example_counter localhost:5000/example_counter`{{execute}}

`docker push 'localhost:5000/example_counter'`{{execute}}

Docker registry is repository for build docker images