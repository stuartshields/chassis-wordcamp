# WordCamp Extension Beta
Adds WordCamp support to Chassis

This is based on [meta-environment](https://github.com/WordPress/meta-environment) by the WordPress [#meta team](https://make.wordpress.org/meta/handbook/) and community.

## Installing & Documentation

1. Clone chassis `wordcamp-dev` by `git clone --recursive https://github.com/Chassis/Chassis wordcamp-dev`.
2. Clone `config.yaml` into `content` folder by `git clone https://github.com/stuartshields/chassis-wordcamp-config.git wordcamp-dev/content`
3. Add the following to your `hosts` file
	1. `10.86.73.70 wordcamp.dev`
	2. `10.86.73.70 central.wordcamp.dev`
	3. `10.86.73.70 2014.new-site.wordcamp.dev`
	4. `10.86.73.70 2014.content.wordcamp.dev`
	5. `10.86.73.70 2014.misc.wordcamp.dev`
	6. `10.86.73.70 2014.seattle.wordcamp.dev`
	
4. `vagrant up`
5. `git clone git@github.com:stuartshields/chassis-wordcamp.git extensions/wordcamp`
6. `vagrant provision` - Depending on your internet connection, this could take a while
7. Download the [wordcamp_dev.sql](https://raw.githubusercontent.com/WordPress/meta-environment/master/wordcamp.dev/provision/wordcamp_dev.sql) into the `vagrant/content` folder
8. `vagrant ssh` into the box
9. `cd /vagrant/content`
10. `wp db import wordcamp_dev.sql`

Note: You may receive the following error:

`The plugin wordcamp-organizer-nags/wordcamp-organizer-nags.php has been deactivated due to an error: Plugin file does not exist.`

You can ignore this error, since the plugin no longer exists in the original repo.

### Adding additional extensions
It's recommended that you install the following Chassis extensions

[PHPCS & WPCS](https://github.com/Chassis/phpcs)

[Memcache](https://github.com/Chassis/memcache)

[Debugging](https://github.com/Chassis/Debugging)

Once all extensions are added you can now `vagrant provision`
