class wordcamp (
	$path	= "/vagrant/extensions/wordcamp",
) {
	file { "${$path}/local-config.php":
		content => template('wordcamp/local-config.php.erb'),
		owner   => 'www-data',
		group   => 'www-data',
		mode    => 0644,
	}

	file { "/vagrant/content/config":
		ensure => "directory",
		owner   => 'www-data',
		group   => 'www-data',
		mode    => 0644,
	}

	file { "/vagrant/content/advanced-cache.php":
		content => template('wordcamp/advanced-cache.php.erb'),
		owner   => 'www-data',
		group   => 'www-data',
		mode    => 0644,
	}

	file { "/vagrant/content/sunrise.php":
		content => template('wordcamp/sunrise.php.erb'),
		owner   => 'www-data',
		group   => 'www-data',
		mode    => 0644,
	}

	file { "/vagrant/content/config/batcache-config.php":
		content => template('wordcamp/batcache-config.php.erb'),
		owner   => 'www-data',
		group   => 'www-data',
		mode    => 0644,
	}

	file { "/vagrant/content/config/is-mobile.php":
		content => template('wordcamp/is-mobile.php.erb'),
		owner   => 'www-data',
		group   => 'www-data',
		mode    => 0644,
	}
}
