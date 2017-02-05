$wordcamp_config = sz_load_config()
class { 'wordcamp':
	php => $wordcamp_config[php]
}
class {"wordcamp::plugins": }

