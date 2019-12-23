#/bin/bash

DATE=$(date +%m-%d-%y-%T)
BACKUP=db-$DATE.sql
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

echo "starting the upload" && \
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
echo "dump done, starting uploading to aws" && \
export AWS_ACCESS_KEY_ID=AKIA4YALNYIXJBKB4XVA && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading your db backup" && \
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME/$BACKUP

