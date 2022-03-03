#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_GREEN='\033[1;32m';
COLOR_BLUE='\033[1;36m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';

print() {
  echo
  echo -e "${COLOR_YELLOW}$@${COLOR_CLEAN}"
}

QTD_PARAMS=$#

example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo "	./build.sh [node-version] [angular-version]"
  echo
  echo " example:"
  echo "	./build.sh 16.14 13.2.3"
  echo -e "==================================${COLOR_CLEAN}"
}

validateParams() {
ERROR=true

  if [ $QTD_PARAMS -ne 2 ]; then
      print $COLOR_RED"Illegal number of parameters"
  else
      ERROR=false
  fi

  [ $ERROR == true ] && example && exit 1
}

_NODE_VERSION=$1
_ANGULAR_CLI_VERSION=$2

validateParams


echo ">>>>>>>>> Criando imagem node"
docker build -t embraslabs/node:$_NODE_VERSION-angular-cli-$_ANGULAR_CLI_VERSION --build-arg _NODE_VERSION=${_NODE_VERSION} --build-arg _ANGULAR_CLI_VERSION=${_ANGULAR_CLI_VERSION} .
