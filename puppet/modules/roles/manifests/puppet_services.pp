class roles::puppet_services {

  package { 'python-pip':
    ensure         => installed,
  }
  
  class { 'apache':
    default_vhost   => false,
  }
  
  case $::operatingsystem {
    'Ubuntu': {
	  $puppetboard_path = '/usr/local/lib/python2.7/dist-packages/puppetboard/static'
	  $puppetboard_user = 'www-data'
	  $puppetboard_group = 'www-data'
	}
	
	'CentOS','RedHat': {
	  $puppetboard_path = '/usr/lib/python2.6/site-packages/puppetboard'
	  $puppetboard_user = 'apache'
	  $puppetboard_group = 'apache'
	}
  }
  
  apache::vhost { 'puppetboard':
    port                        => '80',
    docroot                     => '/var/www/puppetboard',
	aliases                     => [
	  { alias   => '/static',
	    path    => "${puppetboard_path}/static",
	  }
	],
	directories                 => [
	  {
	    path             => '/var/www/puppetboard',
		options          => 'Indexes FollowSymLinks MultiViews'
	  },
	  {
	    path             => "${puppetboard_path}",
		options          => 'Indexes',
		custom_fragment  => "Require all granted\n    WSGIProcessGroup puppetboard\n    WSGIApplicationGroup %{GLOBAL}",
	  },
	],
    wsgi_daemon_process         => 'puppetboard',
    wsgi_daemon_process_options =>
      { processes    => '2', 
        threads      => '15',
		user         => "${puppetboard_user}",
		group        => "${puppetboard_group}",
       },
    wsgi_script_aliases         => { '/' => '/var/www/puppetboard/wsgi.py' },
  }  
  
  class { 'puppetboard':
    puppetdb_host  => 'puppet1.vag.ardemans.int',
	puppetdb_port  => '8080',
	require        => [
	  Package['python-pip'],
	  Apache::Vhost['puppetboard']
	],
  }
  
}