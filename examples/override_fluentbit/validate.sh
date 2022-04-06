#!/usr/bin/env bash

set -Eeuo pipefail

grep -Fq "image: kubesphere/fluentbit-operator:latest" $1
grep -Fq "image: fluentbitImage:fluentbitTag" $1
