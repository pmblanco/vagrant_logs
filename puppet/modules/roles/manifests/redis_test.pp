class roles::redis_test {

  class { 'redis':
    bind        => '0.0.0.0',
    manage_repo => false,
  }

}