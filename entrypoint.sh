#!/bin/sh

set -e

# Capture output
echo "$> oc $*"
output=$( sh -c "oc $*" )
# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.$1"

# Write output to STDOUT
echo "$output"
