class wordcamp::plugins (
	$path	= "/vagrant/extensions/wordcamp",
	$wordcamp_config = sz_load_config(),

	$github_plugins = [
		'svn2github/camptix-network-tools',
		'svn2github/email-post-changes',
		'svn2github/tagregator',
		'Automattic/camptix',
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

	wordcamp::gitcheck { $github_plugins: }

	# Install plugins
	wp::plugin { $plugins:
		location => '/vagrant/wp',
		require  => Class['wp']
	}
}
