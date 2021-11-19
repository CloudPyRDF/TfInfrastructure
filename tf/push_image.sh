#!/bin/bash

set -e
set -o pipefail

ecr_name=$1
root_image_uri=$2

AWS_DEFAULT_REGION=us-east-1
aws_account_id=`aws sts get-caller-identity | grep "Account" | sed 's/[^0-9]//g'`
region=`aws configure get region || echo ${AWS_DEFAULT_REGION}`

aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.${region}.amazonaws.com

docker pull ${root_image_uri}

docker tag ${root_image_uri} ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${ecr_name}

docker push ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${ecr_name}
