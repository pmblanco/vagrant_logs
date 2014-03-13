class roles::common {

  case $::operatingsystem {

    'Ubuntu': {
      class {'roles::common::ubuntu':
      }
    }

  }


  class { 'puppet::repo':
  }
  
}
