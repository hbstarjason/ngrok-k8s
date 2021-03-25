### https://github.com/AliyunContainerService/k8s-for-docker-desktop/blob/v1.19.7/load_images.sh

#!/bin/bash

file="images.properties"

if [ -f "$file" ]
then
  echo "$file found."

  while IFS='=' read -r key value
  do
    #echo "${key}=${value}"
    docker pull ${value}
    docker tag ${value} ${key}
    docker rmi ${value}
  done < "$file"

else
  echo "$file not found."
fi
