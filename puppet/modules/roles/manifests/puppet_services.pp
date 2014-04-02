class roles::puppet_services {

  package { 'python-pip':
    ensure         => installed,
  }
  
  class { 'apache':
    default_vhost   => false,
  }
  
  apache::vhost { 'puppetboard':
    port                        => '80',
    docroot                     => '/var/www/puppetboard',
	aliases                     => [
	  { alias   => '/static',
	    path    => '/usr/lib/python2.6/site-packages/puppetboard/static',
	  }
	],
	directories                 => [
	  {
	    path             => '/var/www/puppetboard',
		options          => 'Indexes FollowSymLinks MultiViews'
	  },
	  {
	    path             => '/usr/lib/python2.6/site-packages/puppetboard',
		options          => 'Indexes',
		custom_fragment  => "Require all granted\n    WSGIProcessGroup puppetboard\n    WSGIApplicationGroup %{GLOBAL}",
	  },
	],
    wsgi_daemon_process         => 'puppetboard',
    wsgi_daemon_process_options =>
      { processes    => '2', 
        threads      => '15',
		user         => 'apache',
		group        => 'apache',
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