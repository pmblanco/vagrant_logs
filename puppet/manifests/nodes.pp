node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
    stage  => 'pre',
  }
  
  class { 'puppet::master':
  }
  
  class { 'puppet::agent':
  }
 
}
