#!/bin/bash
yum install -y docker
systemctl start docker

docker run --name docker-nginx -p 80:80 nginx

# if I want to pull from ECR then I need firstly to do:
# $(aws ecr get-login --no-include-email --region eu-central-1)
# docker pull 338456148177.dkr.ecr.eu-central-1.amazonaws.com/fab_repository:latest
