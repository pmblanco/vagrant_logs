class roles::rabbitmq_test {

  class { 'rabbitmq':
    config_cluster             => true,
	cluster_nodes              => ['rabbit1','rabbit2'],
	wipe_db_on_cookie_change   => true,
	stomp_port                 => '61613',
  }
  
  rabbitmq_user { 'testuser':
    admin    => true,
	password => 'testuser',
    tags     => ['tagtest']
  }

  rabbitmq_vhost { 'testvhost':
    ensure   => present,
  }

  rabbitmq_user_permissions { 'testuser@testvhost':
    configure_permission  => '.*',
    read_permission       => '.*',
    write_permission      => '.*',
  }

  rabbitmq_exchange { 'testex@testvhost':
    ensure   => present,
    user     => 'testuser',
	password => 'testuser',
	type     => 'topic',
	require  => [Rabbitmq_vhost['testvhost'],Rabbitmq_user['testuser']],
  }
  
  rabbitmq_plugin { 'rabbitmq_stomp':
    ensure  => present,
  }
  
  

}