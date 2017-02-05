class wordcamp::plugins (
	$path	= "/vagrant/extensions/wordcamp",
	$wordcamp_config = sz_load_config(),

	$github_plugins = [
		'camptix-network-tools',
		'email-post-changes',
		'tagregator',
	],

	$plugins = [
		'akismet',
		'buddypress',
		'bbpress',
		'camptix-pagseguro',
		'camptix-payfast-gateway',
		'jetpack',
		'json-rest-api',
		'wp-multibyte-patch',
		'wordpress-importer',
	]
)
{
	if ! ( File['/vagrant/content'] ) {
		file { "/vagrant/content":
			ensure => "directory",
		}
	}

	if ! ( File['/vagrant/content/plugins'] ) {
		file { "/vagrant/content/plugins":
			ensure => "directory",
		}
	}

	# Install plugins
	wp::plugin { $plugins:
		location => '/vagrant/wp',
		require  => Class['wp']
	}

	wordcamp::gitcheck { $github_plugins: }

	exec { "camptix-install":
		command => "git clone https://github.com/Automattic/camptix.git /vagrant/content/plugins/camptix",
   		path	=> '/usr/bin/',
		require => Package[ 'git-core' ],
		onlyif  => "test ! -d /vagrant/content/plugins/camptix",
		timeout => 0
	}

	exec { "camptix-update":
		command => "git --work-tree=/vagrant/content/plugins/camptix/ --git-dir=/vagrant/content/plugins/camptix/.git pull origin master",
		path	=> [ '/usr/bin/', '/bin' ],
		require => [ Package[ 'git-core' ] ],
		onlyif  => "test -d /vagrant/content/plugins/camptix",
		timeout => 0
	}

}
