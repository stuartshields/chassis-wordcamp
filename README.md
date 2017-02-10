# WordCamp Extension Beta
Adds WordCamp support to Chassis

This is based on [meta-environment](https://github.com/WordPress/meta-environment) by the WordPress community.

## Installing & Documentation

1. Clone chassis `chassis` by `git clone --recursive https://github.com/Chassis/Chassis chassis`.
2. Download the `config.yaml` - [config template](https://gist.github.com/stuartshields/7673027fa016506d29e061a788a1bde6) into the `/vagrant` folder (this will overwrite the existing file)
3. Download the `config.local.yaml` - [config local template](https://gist.github.com/stuartshields/9080eb14eab87f7de43699e42a392370) into the `/vagrant` folder
4. Add the following to your `hosts` file
	1. `10.86.73.80 wordcamp.dev`
	2. `10.86.73.80 central.wordcamp.dev`
	3. `10.86.73.80 2014.new-site.wordcamp.dev`
	4. `10.86.73.80 2014.content.wordcamp.dev`
	5. `10.86.73.80 2014.misc.wordcamp.dev`
	6. `10.86.73.80 2014.seattle.wordcamp.dev`
	
5. `vagrant up`
6. `git clone git@github.com:stuartshields/chassis-wordcamp.git extensions/wordcamp`
7. `vagrant provision` - Depending on your internet connection, this could take a while
8. Download the [wordcamp_dev.sql](https://raw.githubusercontent.com/WordPress/meta-environment/master/wordcamp.dev/provision/wordcamp_dev.sql) into the `vagrant/content` folder
9. `vagrant ssh` into the box
10. `cd /vagrant/content`
11. `wp db import wordcamp_dev.sql`

Done!

### Adding additional extensions
It's recommended that you install the following Chassis extensions

[PHPCS & WPCS](https://github.com/Chassis/phpcs)

[Memcache](https://github.com/Chassis/memcache)

[Debugging](https://github.com/Chassis/Debugging)

Once all extensions are added you can now `vagrant provision`
