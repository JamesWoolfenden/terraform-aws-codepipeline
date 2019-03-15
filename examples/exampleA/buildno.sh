#!/usr/bin/env sh

BUILDNUMBER=$(aws ssm get-parameters --name "/core/codebuild/cron-poll/dev/buildnumber" --output text --query "Parameters[*].{Value:Value}")
BUILDNUMBER=$((BUILDNUMBER + 1))
export BUILDNUMBER=$BUILDNUMBER
aws ssm put-parameter --name "/core/codebuild/cron-poll/dev/buildnumber" --type "String" --value $BUILDNUMBER --overwrite
export BUILDVERSION=$MAJOR.$MINOR.$BUILDNUMBER
