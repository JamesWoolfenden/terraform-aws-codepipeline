#!/usr/bin/env bash
cd example/examplea || return
rm .terraform.lock.hcl
rm .terraform -fr
terraform init -upgrade
terraform validate
make valid
