node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }
  
  class { 'roles::puppet_master':
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
	ssldir         => '/var/lib/puppet/ssl',
  }
  
  class { 'roles::puppet_services':
  }
  
}
