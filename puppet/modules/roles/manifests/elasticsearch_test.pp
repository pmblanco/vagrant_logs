class roles::elasticsearch_test {

  class { 'elasticsearch':
    java_install            => true,
    manage_repo             => true,
    repo_version            => '1.4',
  }

  elasticsearch::instance { 'I1':
    config                 => {
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

  elasticsearch::plugin{'karmi/elasticsearch-paramedic':
    module_dir => 'paramedic',
    instances   => 'I1',
  }

  elasticsearch::plugin{'lukas-vlcek/bigdesk/2.4.0':
    module_dir => 'bigdesk',
    instances  => 'I1',
  }

  elasticsearch::plugin{'royrusso/elasticsearch-HQ':
    module_dir => 'HQ',
    instances  => 'I1',
  }
  
  elasticsearch::plugin{'elasticsearch/elasticsearch-river-rabbitmq/2.0.0':
    module_dir => 'river-rabbitmq',
    instances  => 'I1',
  }

  elasticsearch::template { 'logstash':
    file       => 'puppet:///modules/roles/elasticsearch_test/logstash_template.json',
	host       => $::ipaddress_eth1,
  }
}
