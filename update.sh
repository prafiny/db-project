#!/bin/bash
set -e
files=(autoload.php composer.json composer-setup.php controller instructions lib README.md tests update.sh view www model)

download() {
if hash wget 2>/dev/null; then
    wget -O "$2" "$1"
else
    curl -L "$1" -o "$2"
fi
}

if [ $# -eq 0 ]; then
    echo "Downloading master.zip"
    echo "----------------------"
    echo ""
    download http://github.com/prafiny/db-project/archive/master.tar.gz master.tar.gz
    tar xvf master.tar.gz
    rm master.tar.gz
    for i in "${files[@]}"
    do
            rm -r -f $i
    done
    echo "Updating"
    echo "--------"
    echo ""
    rm -r -f bin
    bash db-project-master/update.sh --new-version
else
    for i in "${files[@]}"
    do
            cp -r db-project-master/$i .
    done
    rm -r db-project-master
    echo "Updating composer packages"
    echo "-----------------"
    echo ""
    composer update
fi

