class wordcamp (
	$php = $wordcamp_config[php],
	$path	= "/vagrant/extensions/wordcamp",
) {
	file { "${$path}/local-config.php":
		content => template('wordcamp/local-config.php.erb'),
		owner   => 'root',
		group   => 'root',
		mode    => 0644,
	}
}
