#!/bin/bash

git clone git@github.com:CloudPyRDF/curl-to-s3.git
mkdir -p pkg
rm pkg/lambda.zip
zip -j pkg/lambda.zip curl-to-s3/lambda.py
rm -rf curl-to-s3