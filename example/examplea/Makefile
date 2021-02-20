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
	terraform plan -refresh=true

p:
	terraform plan -refresh=true

apply: build

build:
	terraform apply -auto-approve

check: init
	terraform plan -detailed-exitcode

destroy: init
	terraform destroy -force

docs:
	terraform-docs md . > README.md

valid:
	terraform fmt -recursive
	checkov -d . --external-checks-dir ../../checkov
	tfsec .
	terrascan scan

target:
	@read -p "Enter Module to target:" MODULE;
	terraform apply -target $$MODULE

purge:
	$(BLAT)
