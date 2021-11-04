# Makefile
ifdef OS
   BLAT = $(powershell  -noprofile rm .\.terraform\ -force -recurse)
   RM = $(powershell  -noprofile rm .\.terraform\ -force -recurse)
else
   ifeq ($(shell uname), Linux)
      RM  = rm .terraform/modules/ -fr
      BLAT= rm .terraform/ -fr
   endif
endif

.PHONY: all

all: init plan build

init:
	$(RM)
	terraform init -reconfigure -upgrade

plan:
	terraform plan --out tfplan.binary -refresh=true

planned: init
	terraform plan -out tf.plan
	terraform show -json tf.plan  > tf.json
	checkov -f tf.json

p:
	terraform plan -refresh=true

apply: build

build:
	terraform apply -auto-approve

convert:
	terraform show -json tfplan.binary > tfplan.json

check: init
	terraform plan -detailed-exitcode

destroy: init
	terraform destroy -force

docs:
	terraform-docs md . > README.md

valid:
	-terraform fmt -recursive
	-checkov -d . --external-checks-dir ../../checkov
	-tfsec . --tfvars-file examples.auto.tfvars
	-terrascan scan
	docker pull checkmarx/kics:latest
	docker run -v $(CURDIR):/path checkmarx/kics:latest scan --path /path

compare:
	-checkov -d . --external-checks-dir ../../checkov -o json >../../output/checkov.json
	-terrascan scan -o json -x json >../../output/terrascan.json
	-tfsec . --out ../../output/tfsec.json -f json -s
	docker pull checkmarx/kics:latest
	docker run -v $(CURDIR):/path -v $(CURDIR)/../../output:/output checkmarx/kics:latest scan --path "/path" -o "/output/kics.json"

conftest: plan convert
	conftest test ./tfplan.json -p ../../policies

opa: plan convert
	opa eval --format pretty --data terraform.rego --input tfplan.json "data.terraform.analysis.authz"

target:
	@read -p "Enter Module to target:" MODULE;
	terraform apply -target $$MODULE

purge:
	$(BLAT)

cost:
	infracost breakdown --path . --usage-file infracost-usage.yml  --sync-usage-file --show-skipped
