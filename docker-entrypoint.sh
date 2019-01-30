#!/bin/bash
# Interpreter identifier

# Exit on fail
set -e

yarn

if [ $# -eq 0 ]; then
	exec /bin/bash
else
	echo "exec command => $@"
	exec "$@"
fi