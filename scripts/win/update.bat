(
SET mypath=%~dp0%..\..\
cd %mypath% 

echo "bash /vagrant/scripts/update.sh" | vagrant ssh
pause
)
