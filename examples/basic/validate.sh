#!/usr/bin/env bash

set -Eeuo pipefail

grep -Fq "image: kubesphere/fluentbit-operator:latest" $1
grep -Fq "image: kubesphere/fluent-bit:v1.8.3" $1
