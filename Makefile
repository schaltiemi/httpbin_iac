all: build provision

fmt: # Format terraform code
	cd terraform/modules && terraform fmt -recursive
	cd terraform/environments && terragrunt hclfmt

checkov: ## Run checkov on module for security recommandations
	checkov -d ./terraform/modules

docs: terraform/modules/*
	for file in $^ ; do \
	terraform-docs md $${file} > $${file}/README.md ; \
	done

build:
	cd packer && packer build httpbin.pkr.hcl

provision:
	cd terraform/environments/exercise && terragrunt run-all apply --terragrunt-non-interactive
	cd terraform/environments/exercise/01_load_balancer && terragrunt output lb_dns_name

destroy:
	cd terraform/environments/exercise && terragrunt run-all destroy --terragrunt-non-interactive
