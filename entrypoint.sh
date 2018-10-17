#!/bin/sh

set -e

# Capture output
echo "$> oc $*"
output=$( sh -c "oc $*" )
# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.$0"

# Write output to STDOUT
echo "$output"
