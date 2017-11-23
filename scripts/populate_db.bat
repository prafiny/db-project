SET mypath=%~dp0
cd %mypath + "../"

vagrant ssh -c "export LOCAL_DBPROJECT=truebash /vagrant/scripts/populate_db.sh"
