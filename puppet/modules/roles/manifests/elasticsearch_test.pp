class roles::elasticsearch_test {

  class { 'elasticsearch':
    java_install            => true,
    package_url             => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.9.noarch.rpm",
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
	 }
	 
    }
  }

}