SET mypath=%~dp0%..\..\
cd %mypath% 

vagrant ssh -c "export LOCAL_DBPROJECT=true; bash /vagrant/scripts/snapshot_db.sh"
pause
