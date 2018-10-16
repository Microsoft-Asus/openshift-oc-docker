#!/bin/sh

set -e

# Capture output
output=$( sh -c "oc $*" )
# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.${OC_DEFAULT_OUTPUT}"

# if $0 == login ....
cp -r /root/.kube "${HOME}/.kube"

# Write output to STDOUT
echo "$output"
