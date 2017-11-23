SET mypath=%~dp0
cd %mypath + "../"

vagrant ssh -c "bash /vagrant/scripts/snapshot_db.sh"
