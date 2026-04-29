az login
az account set --subscription ""

terraform init
terraform fmt
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
