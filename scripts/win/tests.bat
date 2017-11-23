(
SET mypath=%~dp0%..\..\
cd %mypath% 

echo bash /vagrant/scripts/tests.sh | vagrant ssh
pause
)
