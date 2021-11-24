# Installation

Table of contents
 * [Requirements](#reqirements)
 * [Installation](#installation)

public docker image: https://gallery.ecr.aws/u1r6s2k6/root_lambda

## Requirements

The following tools are necessary for seting up infrastructure:
* terraform
* docker ([in rootless mode](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user))
* aws-cli


## Installation

Ensure that all [requirements](#requirements) are fullfiled.
Put aws credentials to `$HOME/.aws/credentials` file as default credentials.

```bash
# Clone this repository ... (checkout on this branch)

# Go to tf directory
cd tf

terraform init

# This can take a long time
terraform apply -var-file="variables.tfvars"

```