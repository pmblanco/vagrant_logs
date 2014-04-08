class roles::logstash_test {

  class { 'logstash':
    java_install => true,
    package_url  => 'http://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-1.3.3-1_centos.noarch.rpm',
  }

  logstash::configfile { 'pruebas':
    source      => "puppet:///modules/${module_name}/logstash/logstash.conf",
  }

  if $::operatingsystem == "CentOS" {
    file { 'centos_sysconfig_file':
	  ensure    => file,
	  path      => '/etc/sysconfig/logstash',
	  owner     => 'root',
	  group     => 'root',
	  mode      => 0644,
	  content   => 'START=true',
	  notify    => Service['logstash']
	}
	
  }
  
}