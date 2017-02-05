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

}
