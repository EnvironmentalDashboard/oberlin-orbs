#!/bin/bash

docker stop ORBS_APP
docker rm ORBS_APP

docker run -dit -p 80:80 --restart unless-stopped \
  -v $(pwd)/:/var/www/html/ \
  --name ORBS_APP orbs-app
