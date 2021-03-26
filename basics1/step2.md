# Build docker image

Will build docker image and tag as `example_counter`

```
docker build -t example_counter .
```

Docker run

```
docker run -it --rm example_counter
```

```
docker tag example_counter localhost:5000/example_counter
```

```
docker push 'localhost:5000/example_counter'
```
