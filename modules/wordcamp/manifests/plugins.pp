class wordcamp::plugins (
	$path	= "/vagrant/extensions/wordcamp",
	$wordcamp_config = sz_load_config(),

	$github_plugins = {
		# svn2github
		'camptix-network-tools'            => 'svn2github/camptix-network-tools',
		'email-post-changes-specific-post' => 'svn2github/email-post-changes',
		'tagregator'                       => 'svn2github/tagregator',
		'bbpress-network-templates'        => 'svn2github/bbpress-network-templates',
		'camptix-badge-generator'          => 'svn2github/camptix-badge-generator',
		'jquery-ui-css'                    => 'svn2github/jquery-ui-css',
		'multi-event-sponsors'             => 'svn2github/multi-event-sponsors',
		'wc-canonical-years'               => 'svn2github/wc-canonical-years',
		'wc-fonts'                         => 'svn2github/wc-fonts',
		'wc-post-types'                    => 'svn2github/wc-post-types',
		'wcpt'                             => 'svn2github/wcpt',
		'wordcamp-api'                     => 'svn2github/wordcamp-api',
		'wordcamp-coming-soon-page'        => 'svn2github/wordcamp-coming-soon-page',
		'wordcamp-dashboard-widgets'       => 'svn2github/wordcamp-dashboard-widgets',
		'wordcamp-docs'                    => 'svn2github/wordcamp-docs',
		'wordcamp-forms-to-drafts'         => 'svn2github/wordcamp-forms-to-drafts',
		'wordcamp-organizer-reminders'     => 'svn2github/wordcamp-organizer-reminders',
		'wordcamp-participation-notifier'  => 'svn2github/wordcamp-participation-notifier',
		'wordcamp-payments'                => 'svn2github/wordcamp-payments',
		'wordcamp-payments-network'        => 'svn2github/wordcamp-payments-network',
		'wordcamp-qbo'                     => 'svn2github/wordcamp-qbo',
		'wordcamp-remote-css'              => 'svn2github/wordcamp-remote-css',
		'wordcamp-site-cloner'             => 'svn2github/wordcamp-site-cloner',
		'wordcamp-spreadsheets'            => 'svn2github/wordcamp-spreadsheets',
		'wordcamp-wiki'                    => 'svn2github/wordcamp-wiki',

		# Kovshenin
		'camptix-admin-flags' => 'kovshenin/camptix-admin-flags',
		'camptix-attendance'  => 'kovshenin/camptix-attendance',

		# Automattic
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

	$github_plugin_keys = keys( $github_plugins )
	wordcamp::gitcheck { $github_plugin_keys:
		git_urls => $github_plugins
	}

	# Install plugins
	wp::plugin { $plugins:
		location => '/vagrant/wp',
		require  => [
			Class['wp'],
		]
	}

	exec { "mu-plugins-install":
		command => "git clone https://github.com/svn2github/wordcamp-mu-plugins.git /vagrant/content/mu-plugins",
		path	=> '/usr/bin/',
		require => Package[ 'git-core' ],
		onlyif  => "test ! -d /vagrant/content/mu-plugins",
		timeout => 0
	}

	exec { "mu-plugins-update":
		command => "git --work-tree=/vagrant/content/mu-plugins --git-dir=/vagrant/content/mu-plugins/.git pull origin master",
		path	=> [ '/usr/bin/', '/bin' ],
		require => [ Package[ 'git-core' ] ],
		onlyif  => "test -d /vagrant/content/mu-plugins",
		timeout => 0
	}

	exec { "wp-super-cache-plugins-install":
		command => "git clone https://github.com/svn2github/wp-super-cache-plugins.git /vagrant/content/wp-super-cache-plugins",
		path	=> '/usr/bin/',
		require => Package[ 'git-core' ],
		onlyif  => "test ! -d /vagrant/content/wp-super-cache-plugins",
		timeout => 0
	}

	exec { "mu-plugins-update":
		command => "git --work-tree=/vagrant/content/wp-super-cache-plugins --git-dir=/vagrant/content/wp-super-cache-plugins/.git pull origin master",
		path	=> [ '/usr/bin/', '/bin' ],
		require => [ Package[ 'git-core' ] ],
		onlyif  => "test -d /vagrant/content/wp-super-cache-plugins",
		timeout => 0
	}

}
