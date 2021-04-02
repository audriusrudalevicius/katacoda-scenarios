# Deploy to docker registry

Will tag and publish image to docker registry. 
This enables you, colleague or kubernetes cluster able to download builded docker images

First we need to tag it with repository url and namespace to container
`docker tag example_counter localhost:5000/tot/example_counter`{{execute}}

Then push image to registry
`docker push 'localhost:5000/tot/example_counter'`{{execute}}

Docker registry is repository for build docker images
