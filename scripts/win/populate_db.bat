(
SET mypath=%~dp0%..\..\
cd %mypath% 

echo bash /vagrant/scripts/populate_db.sh | vagrant ssh
pause
)
