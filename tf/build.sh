#!/bin/bash

rm -rf pkg && mkdir pkg

git clone git@github.com:CloudPyRDF/curl-to-s3.git
zip -j pkg/eos-lambda.zip curl-to-s3/lambda.py
rm -rf curl-to-s3

git clone git@github.com:CloudPyRDF/InitROOTLambda.git
zip -j pkg/init_lambda.zip InitROOTLambda/lambda.py
rm -rf InitROOTLambda

git clone git@github.com:CloudPyRDF/ROOTLambda.git
zip -j pkg/init_lambda.zip ROOTLambda/lambda.py
rm -rf ROOTLambda