#!/bin/bash
docker build . -t remote-gcp
# docker run -ti --name gcloud-config gcr.io/google.com/cloudsdktool/google-cloud-cli:stable gcloud auth login