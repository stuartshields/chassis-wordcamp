class wordcamp::themes (
	$wordcamp_config = sz_load_config(),
)
{
	exec { "wordcamp-base-install":
		command => "git clone https://github.com/svn2github/wordcamp-base.git /vagrant/content/themes/wordcamp-base",
		path	=> '/usr/bin/',
		require => Package[ 'git-core' ],
		onlyif  => "test ! -d /vagrant/content/themes/wordcamp-base",
		timeout => 0
	}

	exec { "wordcamp-base-update":
		command => "git --work-tree=/vagrant/content/themes/wordcamp-base/ --git-dir=/vagrant/content/themes/wordcamp-base/.git pull origin master",
		path	=> [ '/usr/bin/', '/bin' ],
		require => [ Package[ 'git-core' ] ],
		onlyif  => "test -d /vagrant/content/themes/wordcamp-base/.git",
		timeout => 0
	}

	exec { "wordcamp-base-v2-install":
		command => "git clone https://github.com/svn2github/wordcamp-base-v2.git /vagrant/content/themes/wordcamp-base-v2",
		path	=> '/usr/bin/',
		require => Package[ 'git-core' ],
		onlyif  => "test ! -d /vagrant/content/themes/wordcamp-base-v2",
		timeout => 0
	}

	exec { "wordcamp-base-v2-update":
		command => "git --work-tree=/vagrant/content/themes/wordcamp-base-v2/ --git-dir=/vagrant/content/themes/wordcamp-base-v2/.git pull origin master",
		path	=> [ '/usr/bin/', '/bin' ],
		require => [ Package[ 'git-core' ] ],
		onlyif  => "test -d /vagrant/content/themes/wordcamp-base-v2/.git",
		timeout => 0
	}

	exec { "wordcamp-plan-install":
		command => "git clone https://github.com/svn2github/wordcamp-plan.git /vagrant/content/themes/wordcamp-plan",
		path	=> '/usr/bin/',
		require => Package[ 'git-core' ],
		onlyif  => "test ! -d /vagrant/content/themes/wordcamp-plan",
		timeout => 0
	}

	exec { "wordcamp-plan-update":
		command => "git --work-tree=/vagrant/content/themes/wordcamp-plan/ --git-dir=/vagrant/content/themes/wordcamp-plan/.git pull origin master",
		path	=> [ '/usr/bin/', '/bin' ],
		require => [ Package[ 'git-core' ] ],
		onlyif  => "test -d /vagrant/content/themes/wordcamp-plan/.git",
		timeout => 0
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
		onlyif  => "test -d /vagrant/content/themes/wordcamp-central-2012/.git",
		timeout => 0
	}


}
