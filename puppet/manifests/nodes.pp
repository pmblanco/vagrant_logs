node 'puppet1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }
  
  class { 'roles::puppet_master':
  }
  
}

node 'dashboard1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }

  class { 'puppet::agent':
    report         => 'true',
    masterserver   => 'puppet1.vag.ardemans.int',
	service_status => 'stopped',
	rundir         => '/var/run/puppet',
	ssldir         => '/var/lib/puppet/ssl',
  }
  
  class { 'roles::puppet_services':
  }
  
}
  
node 'es1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }

  class { 'puppet::agent':
    report         => 'true',
    masterserver   => 'puppet1.vag.ardemans.int',
	service_status => 'stopped',
	rundir         => '/var/run/puppet',
	ssldir         => '/var/lib/puppet/ssl',
  }

  
# Rol de Elasticsearch
  class { 'elasticsearch':
    java_install            => true,
    package_url             => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.0.noarch.rpm",
    config                  => {
     'node'                 => {
       'name'               => $::hostname
     },
     'index'                => {
       'number_of_replicas' => '0',
       'number_of_shards'   => '5'
     },
     'network'              => {
       'host'               => $::ipaddress_eth1
     },
	 'cluster'              => {
	   'name'               => 'ClusterPruebas',
	   'routing.allocation.awareness.attributes' => 'rack',
	 }
	 
    }
  }
 
}

node 'es2.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }

  class { 'puppet::agent':
    report         => 'true',
    masterserver   => 'puppet1.vag.ardemans.int',
	service_status => 'stopped',
	rundir         => '/var/run/puppet',
	ssldir         => '/var/lib/puppet/ssl',
  }

# Rol de Elasticsearch
  class { 'elasticsearch':
    java_install            => true,
    package_url             => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.0.noarch.rpm",
    config                  => {
     'node'                 => {
       'name'               => $::hostname
     },
     'index'                => {
       'number_of_replicas' => '0',
       'number_of_shards'   => '5'
     },
     'network'              => {
       'host'               => $::ipaddress_eth1
     },
	 'cluster'              => {
	   'name'               => 'ClusterPruebas',
	   'routing.allocation.awareness.attributes' => 'rack',
	 }
    }
  }
  
}


node 'logs1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }

  class { 'puppet::agent':
    report         => 'true',
    masterserver   => 'puppet1.vag.ardemans.int',
	service_status => 'stopped',
	rundir         => '/var/run/puppet',
	ssldir         => '/var/lib/puppet/ssl',
  }
  
  class { 'roles::logstash_test':
  }
  
}