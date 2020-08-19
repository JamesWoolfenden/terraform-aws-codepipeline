#!/usr/bin/env bash
cd example/examplea || return
rm .terraform -fr
terraform init
terraform validate
make valid
