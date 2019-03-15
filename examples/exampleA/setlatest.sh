#!/usr/bin/env sh
aws ssm put-parameter --name "/core/codebuild/cron-poll/dev/latest" --type "String" --value "$BUILDVERSION" --overwrite
