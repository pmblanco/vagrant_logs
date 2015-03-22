
  
node 'es1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }
  
  # Rol de Elasticsearch
  class { 'roles::elasticsearch_test':
  }
 
}

node 'es2.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }

  # Rol de Elasticsearch
  class { 'roles::elasticsearch_test':
  }
  
}


node 'logs1.vag.ardemans.int' {

  class { 'roles::common':
    stage          => 'pre',
  }

  
  class { 'roles::logstash_test':
  }
  
  class { 'roles::redis_test':
  }
  
  class { 'kibana4':
    package_provider      => 'archive',
    package_ensure        => '4.0.1-linux-x64',
    package_download_url  => 'https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz',
    elasticsearch_url     => 'http://es1.vag.ardemans.int:9200'
  }
}


node /rabbit[12].vag.ardemans.int/ {

  class { 'roles::common':
  }->
  
  class { 'roles::rabbitmq_test':
  }


}
