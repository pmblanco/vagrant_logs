node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
  }
  
  class { 'puppet::master':
  }
  
  class { 'puppet::agent':
  }
 
}
