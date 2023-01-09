# Terraform makefile
#
#
config_file:=development.tfvars

docs:
	terraform-docs markdown table --output-file README.md --output-mode inject .

init:
	terraform init -backend-config=../global/backend/backend.hcl -upgrade
fmt:
	terraform fmt

validate:
	terraform validate

plan: fmt validate
	terraform plan \
	-var-file=../global/backend/backend.hcl \
	-var-file=$(config_file) \
	-out vpc.plan

apply: vpc.plan
	terraform apply "vpc.plan"
	rm vpc.plan

destroy:
	terraform plan \
	-var-file=../global/backend/backend.hcl \
	-var-file=$(config_file) \
	-destroy \
	-out vpc.plan
	terraform apply "vpc.plan"
	rm vpc.plan