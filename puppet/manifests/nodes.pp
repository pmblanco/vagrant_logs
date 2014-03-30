node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }
  
  class { 'puppet::master':
    manifestdir     => '/vagrant/puppet/manifests',
    manifest        => '/vagrant/puppet/manifests/site.pp',
	modulepath      => '/vagrant/puppet/modules',
    dns_alt_names   => 'puppet.vag.ardemans.int',
	puppetdb_server => 'puppet1.vag.ardemans.int',
	reports         => 'store,puppetdb',
	storeconfigs    => 'true',
	storeconfigs_backend => 'puppetdb',
	autosign        => ['*','*.prueba.com'],
    report          => 'true',
    certname        => 'puppet1.vag.ardemans.int',
    masterserver    => 'puppet1.vag.ardemans.int',
	agent_status    => 'stopped',
	rundir          => '/var/run/puppet',
	ssldir          => '/var/lib/puppet/ssl',
  }
  
  puppet::environment { 'dev':
    manifestdir    => '/etc/puppet/environments/dev/manifests',
    manifest       => 'site.pp',
    modulepath     => '/etc/puppet/environments/dev/modules',
  }
  
  class { 'puppet::db':
  }

}

node 'dashboard1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }

  class { 'puppet::agent':
    report         => 'true',
    masterserver   => 'puppet1.vag.ardemans.int',
	service_status => 'stopped',
	rundir         => '/var/run/puppet',
	ssldir         => '/etc/puppet/ssl',
  }
  
  package { 'python-pip':
    ensure         => installed,
  }
  
  class { 'apache':
    default_vhost   => false,
  }
  
  apache::vhost { 'puppetboard':
    port                        => '80',
    docroot                     => '/var/www/puppetboard',
    wsgi_daemon_process         => 'puppetboard',
    wsgi_daemon_process_options =>
      { processes    => '2', 
        threads      => '15', 
       },
    wsgi_process_group          => 'puppetboard',
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
