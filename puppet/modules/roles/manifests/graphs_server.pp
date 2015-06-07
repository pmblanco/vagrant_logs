class roles::graphs_server {

  $mysql_root_password = hiera('databases::mysql_server::root_password')

  class { 'profiles::databases::mysql_server':
    root_password   => $mysql_root_password,
  }

}
