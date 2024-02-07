#!/bin/bash

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
if [ "$GIT_BRANCH" == "origin/dev" ]; then 
docker tag myreact abarna272/dev
docker push abarna272/dev

elif [ "$GIT_BRANCH" == "origin/master" ]; then
docker tag myreact abarna272/prod
docker push abarna272/prod
fi
