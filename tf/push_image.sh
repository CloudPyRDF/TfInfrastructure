
ecr_name=$1

ROOT_LAMBDA_IMAGE=public.ecr.aws/u1r6s2k6/root_lambda:latest

AWS_DEFAULT_REGION=us-east-1
aws_account_id=`aws sts get-caller-identity | grep "Account" | sed 's/[^0-9]//g'`
region=`aws configure get region || echo ${AWS_DEFAULT_REGION}`

aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.${region}.amazonaws.com

docker pull ${ROOT_LAMBDA_IMAGE}

docker tag ${ROOT_LAMBDA_IMAGE} ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${ecr_name}

docker push ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${ecr_name}
