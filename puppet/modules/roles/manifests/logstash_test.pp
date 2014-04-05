class roles::logstash_test {

  class { 'logstash':
    java_install => true,
    package_url  => 'http://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-1.3.3-1_centos.noarch.rpm',
  }


  logstash::configfile { 'prueba':
    source      => "puppet:///modules/${module_name}/logstash/logstash-config.conf",
  }
}