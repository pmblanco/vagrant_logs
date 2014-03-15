node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }
  
  class { 'puppet::agent':
    report       => 'true',
    certname     => 'puppet1.vag.ardemans.int',
    masterserver => 'puppet1.vag.ardemans.int',
  }
  
  class { 'puppet::master':
    manifestdir    => '/vagrant/puppet/manifests',
    manifest       => '/vagrant/puppet/manifests/site.pp',
	modulepath     => '/vagrant/puppet/modules',
    reports        => 'puppetdb',
    dns_alt_names  => 'puppet.vag.ardemans.int',
  }
  
  class { 'puppet::configmain':
    certname       => 'puppet1.vag.ardemans.int',
  }
  
  puppet::environment { 'dev':
    manifestdir    => '/etc/puppet/environments/dev/manifests',
    manifest       => 'site.pp',
    modulepath     => '/etc/puppet/environments/dev/modules',
  }

}
