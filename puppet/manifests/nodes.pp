node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }
  
  class { 'puppet::master':
    reports        => 'puppetdb',
	dns_alt_names  => 'perico.palotes.com,tomaya.ya.yaa',
  }
  
  class { 'puppet::configmain':
    certname       => 'prueba-cert-name-2',
    masterserver   => 'prueba',
  }
  
  puppet::environment { 'dev':
    manifestdir    => '/etc/puppet/environments/dev/manifests',
	manifest       => 'site.pp',
	modulepath     => '/etc/puppet/environments/dev',
  }

  puppet::environment { 'pre':
    manifestdir    => '/etc/puppet/environments/pre/manifests',
	manifest       => 'site.pp',
	modulepath     => '/etc/puppet/environments/pre',
  }

  puppet::environment { 'int':
    manifestdir    => '/etc/puppet/environments/int/manifests',
	manifest       => 'site.pp',
	modulepath     => '/etc/puppet/environments/int',
  }
 
  

}
