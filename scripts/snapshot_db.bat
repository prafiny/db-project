SET mypath=%~dp0
cd %mypath + "../"

vagrant ssh -c "export local_database=true; bash /vagrant/scripts/snapshot_db.sh"
