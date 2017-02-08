class wordcamp (
	$path	= "/vagrant/extensions/wordcamp",
) {
	file { "${$path}/local-config.php":
		content => template('wordcamp/local-config.php.erb'),
		owner   => 'root',
		group   => 'root',
		mode    => 0644,
	}

	file { "/vagrant/content/mu-plugins/sandbox-functionality.php":
		content => template('wordcamp/sandbox-functionality.php.erb'),
		owner   => 'root',
		group   => 'root',
		mode    => 0644,
	}
}
