#!/bin/bash
# Interpreter identifier

# Exit on fail
set -e

yarn install --prefer-offline --no-progress

if [ $# -eq 0 ]; then
	exec /bin/bash
else
	echo "exec command => $@"
	exec "$@"
fi