# WordCamp meta development environment extension for Chassis
define wordcamp::gitcheck ( $git_urls )
{
  exec { "${$title}-install":
    command => "git clone https://github.com/${$git_urls[$title]}.git /vagrant/content/plugins/${$title}",
    path    => '/usr/bin/',
    require => Package[ 'git-core' ],
    onlyif  => "test ! -d /vagrant/content/plugins/${$title}",
    timeout => 0
  }

  exec { "${$title}-update":
    command => "git --work-tree=/vagrant/content/plugins/${$title} --git-dir=/vagrant/content/plugins/${$title}/.git pull origin master",
    path    => [ '/usr/bin/', '/bin' ],
    require => [ Package[ 'git-core' ] ],
    onlyif  => "test -d /vagrant/content/plugins/${$title}/.git",
    timeout => 0
  }
}
