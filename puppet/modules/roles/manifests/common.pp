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
  
}
