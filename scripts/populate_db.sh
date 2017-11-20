#!/bin/sh
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd "$SCRIPTPATH/../"

if [ "$local_database" = "true" ]; then
	
else
	vagrant ssh -c "export local_database=true; bash /vagrant/scripts/populate_db.sh"
	read -n1 -r -p 'press a key to close' k
fi

