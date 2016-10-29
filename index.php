<?php

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Mvc\Application;
use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\Session\Adapter\Files as Session;

try {

	// Register an autoloader
	$loader = new Loader();
	$loader->registerDirs(array(
		'app/controllers/',
		'app/models/'
	));

	$loader->register();

	// Create a DI
	$di = new FactoryDefault();

	define('APPLICATION_PATH', __DIR__);

	// Load the general configuration
	$config = new \Phalcon\Config\Adapter\Ini('app/config/testing.ini');

	$di->set('config', $config);

	// setting up the database using the configuration
	$di->set('db', function () use ($config) {
		return new DbAdapter(array(
			"host"     => $config->database->host,
			"username" => $config->database->username,
			"password" => $config->database->password,
			"dbname"   => $config->database->dbname,
			"port"     => $config->database->port,
            "charset"  => "utf8"
		));
	});

	// Register Volt as a service
	$di->set('voltService', function ($view, $di) {
		$volt = new Volt($view, $di);
		$volt->setOptions(
			array(
				"compiledPath"      => "app/views.cache/",
				"compiledExtension" => ".compiled",
				'compileAlways' 	=> true
			)
		);
		$compiler = $volt->getCompiler();
		$compiler->addFunction('strtotime', 'strtotime');
		$compiler->addFilter("remove_dashes", function($resolvedArgs) {
			return "str_replace('-', ' ', $resolvedArgs)";
		});
		return $volt;
	});


	// Register Volt as template engine
	$di->set('view', function () {
		$view = new View();
		$view->setViewsDir('app/views/');
		$view->registerEngines(
			array(
				".volt" => 'voltService'
			)
		);
		return $view;
	});

	// Start the session the first time when some component request the session service
	$di->setShared('session', function () {
		$session = new Session();
		$session->start();
		return $session;
	});

    ini_set('date.timezone', 'Europe/Sofia');
    date_default_timezone_set('Europe/Sofia');
    $di->getShared('db')->query('SET time_zone = "+3:00"')->execute();

	// Handle the request
	$application = new Application($di);

	echo $application->handle()->getContent();

} catch (\Exception $e) {
	 echo "PhalconException: ", $e->getMessage();
}