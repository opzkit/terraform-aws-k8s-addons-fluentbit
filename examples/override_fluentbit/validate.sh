#!/usr/bin/env bash

set -Eeuo pipefail

grep -Fq "image: kubesphere/fluent-operator:v1.0.2" $1
grep -Fq "image: fluentbitImage:fluentbitTag" $1
