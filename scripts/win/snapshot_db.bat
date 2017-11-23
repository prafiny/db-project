(
SET mypath=%~dp0%..\..\
cd %mypath% 

echo "bash /vagrant/scripts/snapshot_db.sh" | vagrant ssh
pause
)
