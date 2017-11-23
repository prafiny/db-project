#!/bin/sh
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd "$SCRIPTPATH/../"
vagrant halt
read -n1 -r -p 'press a key to close' k

