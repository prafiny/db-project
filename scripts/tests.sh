#!/bin/sh
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd "$SCRIPTPATH/../"

if [ "$local_database" = "true" ]; then
	bash scripts/populate_db.sh "test"
	for i in "tests/"*; do
		phpunit --bootstrap "autoload.php" "$i"
	done
else
	vagrant ssh -c "export local_database=true; bash /vagrant/scripts/tests.sh"
	read -n1 -r -p 'press a key to close' k
fi
