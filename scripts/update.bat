SET mypath=%~dp0
cd %mypath + "../"

vagrant ssh -c "bash /vagrant/scripts/update.sh"
