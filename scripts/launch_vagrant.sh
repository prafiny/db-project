#!/bin/sh
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd "$SCRIPTPATH/../"
vagrant up

read -n1 -r -p 'press a key to close' k
