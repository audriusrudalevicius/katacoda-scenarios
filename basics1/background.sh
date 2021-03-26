set -euo pipefail
IFS=$'\n\t'

mkdir /root/tot || true
cd /root/tot
docker run -d -p 5000:5000 --restart=always --name registry registry:2

kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=/root/config.json \
    --type=kubernetes.io/dockerconfigjson

#echo 'done' > /opt/katacoda-background-finished