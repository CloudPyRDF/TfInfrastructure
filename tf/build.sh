#!/bin/bash

mkdir -p pkg

git clone git@github.com:CloudPyRDF/curl-to-s3.git
rm pkg/eos-lambda.zip
zip -j pkg/eos-lambda.zip curl-to-s3/lambda.py
rm -rf curl-to-s3

git clone git@github.com:CloudPyRDF/InitROOTLambda.git
rm pkg/init-lambda.zip
zip -j pkg/init-lambda.zip InitROOTLambda/lambda.py
rm -rf InitROOTLambda