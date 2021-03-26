mkdir /root/tot
cd /root/tot
docker run -d -p 5000:5000 --restart=always --name registry registry:2