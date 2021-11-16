#!/bin/bash

rm -rf pkg && mkdir pkg

git clone https://github.com/CloudPyRDF/curl-to-s3.git
zip -j pkg/eos_lambda.zip curl-to-s3/lambda.py
rm -rf curl-to-s3

git clone https://github.com/CloudPyRDF/reduce_lambda.git
zip -j pkg/reduce_lambda.zip reduce_lambda/lambda.py
rm -rf reduce_lambda

git clone https://github.com/CloudPyRDF/ROOTLambda.git
zip -j pkg/root_lambda.zip ROOTLambda/lambda.py
rm -rf ROOTLambda
