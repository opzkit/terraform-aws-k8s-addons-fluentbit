#!/usr/bin/env bash

set -Eeuo pipefail

grep -Fq "image: operatorImage:operatorTag" $1
grep -Fq "image: kubesphere/fluent-bit:v1.8.3" $1
