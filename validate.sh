#!/usr/bin/env bash
cd example/exampleA || return
rm .terraform -fr
terraform init
terraform validate
