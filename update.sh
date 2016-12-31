#!/bin/bash -e
files=("autoload.php"
"composer.json"
"composer-setup.php"
"controller"
"instructions"
"lib"
"README.md"
"server.bat"
"tests"
"tests.bat"
"view"
"www")

if [ $# -eq 0 ]; then
    wget -P master.zip https://github.com/prafiny/db-project/archive/master.zip
    unzip master.zip
    for i in "${files[@]}"
    do
            rm -r $i
    done
    bash db-project-master/update.sh --new-version
else
    for i in "${files[@]}"
    do
            cp db-project-master/$i .
    done
    rm db-project-master
    rm master.zip
fi
