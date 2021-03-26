set -euo pipefail
IFS=$'\n\t'

mkdir /root/tot
cd /root/tot
docker run -d -p 5000:5000 --restart=always --name registry registry:2

echo "Starting Katacoda... This may take a few moments"

while [ ! -f /usr/local/bin/wait.sh ]; do sleep 1; done; sleep 1;  /usr/local/bin/wait.sh; /usr/local/bin/start.sh

kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=/root/config.json \
    --type=kubernetes.io/dockerconfigjson

echo 'done' > /opt/katacoda-background-finished