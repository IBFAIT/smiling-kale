#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eae796bf5e27200194ec364/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eae796bf5e27200194ec364
curl -s -X POST https://api.stackbit.com/project/5eae796bf5e27200194ec364/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5eae796bf5e27200194ec364/webhook/build/publish > /dev/null
