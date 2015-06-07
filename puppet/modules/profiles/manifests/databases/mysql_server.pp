class profiles::databases::mysql_server (
  $root_password    = undef,
) {

  class { '::mysql::server':
    root_password            => $root_password,
    remove_default_accounts  => true,
  }

}
