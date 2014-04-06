class roles::logstash_test {

  class { 'logstash':
    java_install => true,
    #package_url  => 'http://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-1.4.0-1_centos.noarch.rpm',
  }

  logstash::configfile { 'pruebas':
    source      => "puppet:///modules/${module_name}/logstash/logstash.conf",
  }

  
}