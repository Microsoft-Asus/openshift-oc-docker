#!/bin/sh

set -e

# Capture output
output=$( sh -c "oc $*" )
# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.${OC_DEFAULT_OUTPUT}"

# Write output to STDOUT
echo "$output"

# if $0 == login ....
#cp -r /root/.kube "${HOME}/.kube"

ls -la $HOME
ls -la "$HOME"
