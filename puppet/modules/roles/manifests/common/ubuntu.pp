class roles::common::ubuntu {
  
  class {'apt':
    disable_keys   => true,
  }

}
