SET mypath=%~dp0%..\..\
cd %mypath% 
vagrant up --no-provision
(
vagrant provision
pause
)
