#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$SCRIPTPATH/../"

if [ $# -lt 1 ]; then
    echo "USAGE : ./purge_db.sh env"
    exit
fi

python3 scripts/get_yaml.py "config/db.yaml" "$1"

mysqladmin -h"$server" -u"$username" -p"$password" drop "$db"

