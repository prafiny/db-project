#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source "$SCRIPTPATH/helpers/macros.sh"
check_term

if [ -z "$LOCAL_DBPROJECT" ]; then
	vagrant ssh -c "export LOCAL_DBPROJECT=true; bash /vagrant/scripts/reset_env.sh"
    exit
fi

PURGE_MSTUD=true bash update.sh

rm -r ../model_student
cp -r /home/ubuntu/.db-project/model_student ../
rm -r ../sql
cp -r /home/ubuntu/.db-project/sql ../
bash purge_db.sh "app"
bash purge_db.sh "test"
