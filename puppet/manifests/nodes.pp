
  
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
  
}


node /rabbit[12].vag.ardemans.int/ {

  class { 'roles::common':
  }->
  
  class { 'roles::rabbitmq_test':
  }

}
