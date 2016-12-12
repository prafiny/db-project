# db-project

## The project
The goal is to fill out the model functions so that this twitter clone works just file

## Requirements
* PHP >= 7.0
* MySQL/MariaDB
* Composer
* php.exe in PATH (see https://john-dugan.com/add-php-windows-path-variable/)

## Bootstrap the project
* Download the code and unzip it or clone it
* Open a cmd prompt at the root
* Run `composer install`
* Your app and test databases must be set with all the tables
* Edit the `config/db.yaml.example` file and save as `config/db.yaml`

You can launch a builtin server by launching the `server.bat` script or launch the tests with the `tests.bat` script

## Structure
* `www/` contains the root of the server (pages, css stylesheets and images)
* `config/` contains every configuration file (for db, …)
* `lib/` contains libraries such as database handling, session, etc.
* `model/` contains every data handling modules *TO COMPLETE*
* `view/` contains every interface files
* `controller/` contains every behaviour files
* `tests/` contains the unit tests suites
