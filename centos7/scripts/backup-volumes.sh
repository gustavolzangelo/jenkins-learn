#!/bin/bash

DATE=$(date +%m-%d-%y-%T)
AWS_SECRET=$1
BUCKET_NAME=$2

echo "starting upload $DATE"
export AWS_ACCESS_KEY_ID=AKIA4YALNYIXJBKB4XVA && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading your db backup" && \
aws s3 cp ../jenkins_home s3://$BUCKET_NAME/$DATE/db_data/ && \
aws s3 cp ../db_data s3://$BUCKET_NAME/$DATE/centos7/scripts/ && \
aws s3 cp /var/jenkins_home s3://$BUCKET_NAME/$DATE/jenkins_home/ && \
aws s3 cp /tmp/script.sh s3://$BUCKET_NAME/$DATE/centos7/script.sh