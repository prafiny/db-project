#!/bin/bash
set -e
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source "$SCRIPTPATH/helpers/macros.sh"
check_term

if [ ! $LOCAL_DBPROJECT = true ]; then
	vagrant ssh -c "export LOCAL_DBPROJECT=true; bash /vagrant/scripts/update.sh"
fi

files=(autoload.php composer.json controller instructions lib README.md tests view www model scripts)
REPO="https://github.com/prafiny/db-project.git"
TMP_REPO=/home/ubuntu/db-project

download() {
if hash wget 2>/dev/null; then
    wget -O "$2" "$1"
else
    curl -L "$1" -o "$2"
fi
}

clone_or_pull() {
	if [ -e "$2" ]; then
		git -C "$2" fetch origin
		reslog=$(git -C "$2" log HEAD..origin/master --oneline)
		if [[ "${reslog}" != "" ]] ; then
			git -C "$2" merge origin/master
		else
			exit
		fi
	else
		git clone "$1" "$2"
	fi
}

if [ $# -eq 0 ]; then
    echo "Pulling from repo"
    echo "-----------------"
    echo ""
    clone_or_pull "$REPO" "$TMP_REPO"
    RESUlT="$?"
    if [ $RESULT ]; then
        >&2 echo "The script couldn't be updated."
	exit $RESULT
    fi
    cd "$SCRIPTPATH/../"
    for i in "${files[@]}"
    do
            rm -r -f $i
    done
    echo "Updating"
    echo "--------"
    echo ""
    rm -r -f bin
    bash $TMP_REPO/scripts/update.sh --new-version
else
    for i in "${files[@]}"
    do
            cp -r --preserve=mode "$SCRIPTPATH/../$i" .
    done
    echo "Updating composer packages"
    echo "--------------------------"
    echo ""
    composer update
fi


