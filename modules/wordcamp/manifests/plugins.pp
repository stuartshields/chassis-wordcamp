class wordcamp::plugins (
	$path	= "/vagrant/extensions/wordcamp",
	$wordcamp_config = sz_load_config(),

	$github_plugins = {
		'camptix-network-tools' => 'svn2github/camptix-network-tools',
		'email-post-changes' => 'svn2github/email-post-changes',
		'tagregator' => 'svn2github/tagregator',
		'camptix' => 'Automattic/camptix',
	},

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

	#wordcamp::gitcheck { $github_plugins: }

	$github_plugin_keys = keys( $github_plugins )
	wordcamp::gitcheck { $github_plugin_keys:
		git_urls => $github_plugins
	}

	exec { "wordcamp-central-2012-install":
		command => "git clone https://github.com/svn2github/wordcamp-central-2012.git /vagrant/content/themes/wordcamp-central-2012",
   		path	=> '/usr/bin/',
		require => Package[ 'git-core' ],
		onlyif  => "test ! -d /vagrant/content/themes/wordcamp-central-2012",
		timeout => 0
	}

	exec { "wordcamp-central-2012-update":
		command => "git --work-tree=/vagrant/content/themes/wordcamp-central-2012/ --git-dir=/vagrant/content/themes/wordcamp-central-2012/.git pull origin master",
		path	=> [ '/usr/bin/', '/bin' ],
		require => [ Package[ 'git-core' ] ],
		onlyif  => "test -d /vagrant/content/themes/wordcamp-central-2012",
		timeout => 0
	}

}
