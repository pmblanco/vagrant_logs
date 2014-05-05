class roles::common {

  case $::operatingsystem {

    'Ubuntu': {
      class {'roles::common::ubuntu':
      }
    }
	
	'CentOS','RedHat': {
	  class {'roles::common::redhat':
	  }
	}

  }

  class { 'puppet::repo':
  }
  
  file { '/usr/local/sbin/repuppet':
    ensure   => file,
	owner    => 'root',
	group    => 'root',
	mode     => '0755',
	content  => "#!/bin/bash\npuppet apply --debug --modulepath=/vagrant/puppet/modules/ --hiera_config=/vagrant/hiera.yaml /vagrant/puppet/manifests/site.pp",
  }  
  
}
