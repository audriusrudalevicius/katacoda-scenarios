# Build docker image

This will build docker image executing each new command in Dockerfile. In the end tag builded container as *example_counter*

It will include all files under its build context that is specified as `.` (current dir) in this example. You can create .dockerignore to exclude smething.

`docker build -t example_counter .`{{execute}}

Docker run to test it works

`docker run -it --rm example_counter`{{execute}}

Ctrl+c to kill or `clear`{{execute interrupt}}

## Reads for best practices

[Important guidlines of docker file](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* Keep images small
* Understand build context
* Create ephemeral containers (like processes)

[12 Factor Applications mainfesto](https://12factor.net/)
* Execute the app as one or more stateless (share-nothing) processes
* Store config in the environment
* Scale out via the process model
* Keep development, staging, and production as similar as possible
