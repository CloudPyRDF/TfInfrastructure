[[ ! -d ./pkg ]] && ./build.sh
terraform apply -var-file="logpass.tfvars" -auto-approve
terraform output -json > terraform_config
