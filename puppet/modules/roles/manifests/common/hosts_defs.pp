class roles::common::hosts_defs {

  host { 'localhost':
    ensure       => 'present',
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
    ip           => '127.0.0.1',
    target       => '/etc/hosts',
  }

  host { 'es1.vag.prisadigital.int':
    ensure       => 'present',
    host_aliases => ['es1.vag','es1'],
    ip           => '192.168.5.41',
    target       => '/etc/hosts',
  }

  host { 'es2.vag.prisadigital.int':
    ensure       => 'present',
    host_aliases => ['es2.vag','es2'],
    ip           => '192.168.5.42',
    target       => '/etc/hosts',
  }

  host { 'logs1.vag.prisadigital.int':
    ensure       => 'present',
    host_aliases => ['logs1.vag','logs1'],
    ip           => '192.168.5.46',
    target       => '/etc/hosts',
  }

  host { 'rabbit1.vag.prisadigital.int':
    ensure       => 'present',
    host_aliases => ['rabbit1.vag','rabbit1'],
    ip           => '192.168.5.51',
    target       => '/etc/hosts',
  }

  host { 'rabbit2.vag.prisadigital.int':
    ensure       => 'present',
    host_aliases => ['rabbit2.vag','rabbit2'],
    ip           => '192.168.5.52',
    target       => '/etc/hosts',
  }

}