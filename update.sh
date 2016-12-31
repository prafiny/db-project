#!/bin/bash -e
files="autoload.php composer.json composer-setup.php controller instructions lib README.md tests update.bat update.ps1 update.sh view www"

if [ $# -eq 0 ]; then
    wget -O master.tar.gz http://github.com/prafiny/db-project/archive/master.tar.gz
    tar xvf master.tar.gz
    for i in "${files}"
    do
            rm -r -f $i
    done
    rm -r -f bin
    bash db-project-master/update.sh --new-version
else
    for i in "${files}"
    do
            cp -r db-project-master/$i .
    done
    rm -r db-project-master
    rm master.zip
    mkdir bin
    php composer-setup.php --install-dir=bin --filename=composer
    php bin/composer update
fi

