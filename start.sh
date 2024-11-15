#!/bin/bash
MYGCLOUD_PATH="./mygcloud"
CERTS_PATH="./certs"
RUN_CMD="gcloud compute instances start talib-stock-v1"
RUN_CMD="gcloud compute instances list --project windwaker1121"
RUN_CMD="/bin/bash"

if ! [ -d $MYGCLOUD_PATH ]; then
    echo "Directory is not exsist $MYGCLOUD_PATH, auto create"
    mkdir -m 777 $MYGCLOUD_PATH
fi
if ! [ -d $CERTS_PATH ]; then
    echo "Directory is not exsist $CERTS_PATH, auto create"
    mkdir -m 777 $CERTS_PATH
fi

docker run -ti --rm \
            --name gcloud-config \
            -e CLOUDSDK_CONFIG=/config/mygcloud \
            -v `pwd`/mygcloud:/config/mygcloud \
            -v `pwd`/certs:/certs  gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine \
            $RUN_CMD