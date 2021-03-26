mkdir /root/tot || true
docker run -d -p 5000:5000 --restart=always --name registry registry:2
minikube start

echo 'done' > /opt/katacoda-background-finished