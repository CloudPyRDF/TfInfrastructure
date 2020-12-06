#!/bin/bash

rm -rf pkg && mkdir pkg

git clone git@github.com:CloudPyRDF/curl-to-s3.git
zip -j pkg/eos_lambda.zip curl-to-s3/lambda.py
rm -rf curl-to-s3

git clone git@github.com:CloudPyRDF/InitROOTLambda.git
zip -j pkg/init_lambda.zip InitROOTLambda/lambda.py
rm -rf InitROOTLambda

git clone git@github.com:CloudPyRDF/reduce_lambda.git
zip -j pkg/reduce_lambda.zip reduce_lambda/lambda.py
rm -rf reduce_lambda

git clone git@github.com:CloudPyRDF/ROOTLambda.git
zip -j pkg/root_lambda.zip ROOTLambda/lambda.py
rm -rf ROOTLambda

git clone git@github.com:CloudPyRDF/split_lambda.git
zip -j pkg/split_lambda.zip split_lambda/lambda.py
rm -rf split_lambda
