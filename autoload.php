<?php
// @codingStandardsIgnoreFile
// @codeCoverageIgnoreStart
// this is an autogenerated file - do not edit
function require_wildcard($w) {
    foreach (glob($w) as $filename)
    {
        require_once $filename;
    }
}

require_once("/home/ubuntu/vendor/autoload.php");
require_once("lib/db.php");
require_wildcard("model_student/*.php");
require_wildcard("model/*.php");

Db::connect(true);
