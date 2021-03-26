# Deploy to docker registry

Will tag and publish image to docker registry. 
This enables you, colegue or kubernetes cluster able to download builded docker images

First we need tag it with repository url and namespace to container
`docker tag example_counter localhost:5000/tot/example_counter`{{execute}}

`docker push 'localhost:5000/tot/example_counter'`{{execute}}

Docker registry is repository for build docker images