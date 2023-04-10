.EXPORT_ALL_VARIABLES:
AWS_PAGER = ""

all: check init plan deploy
		@echo "\n>>>>> Done!"

commit: check init format
		@echo "\n>>>>> Done!"

setup: check init format
		@echo "\n>>>>> Done!"
		cd setup; ./setup-eks.sh

check:
		@echo "\n>>>>> Check environment"
		terraform --version >/dev/null 2>&1 || { echo >&2 "I require Terraform but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }
		aws --version >/dev/null 2>&1 || { echo >&2 "I require Terraform but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }
		jq --version >/dev/null 2>&1 || { echo >&2 "I require jq utility but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }
		aws sts get-caller-identity --no-paginate

init:
		@echo "\n>>>>> Initialize Terraform"
		terraform --version
		cd IaC; terraform init -input=false
		cd iac; terraform validate

plan:
		@echo "\n>>>>> terraform plan"
		cd IaC; terraform validate
		cd IaC; terraform plan -lock=false -input=false

deploy:
		@echo "\n>>>>> Deploying solution"
		cd IaC; terraform plan -lock=false -input=false
		cd IaC; terraform apply -auto-approve -input=false

format:
		@echo "\n>>>>> terraform prepare for commit"
		cd IaC; terraform validate
		cd IaC; terraform fmt -recursive

destroy:
		@echo "\n>>>>> Cleanup solution"
		cd IaC; terraform destroy -target=module.kubernetes_addons -auto-approve
		cd IaC; terraform destroy -target=module.eks_blueprints -auto-approve
		cd IaC; terraform destroy -auto-approve
