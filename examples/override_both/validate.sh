#!/usr/bin/env bash

set -Eeuo pipefail

grep -Fq "image: operatorImage:operatorTag" $1
grep -Fq "image: fluentbitImage:fluentbitTag" $1
