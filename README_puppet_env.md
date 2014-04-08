# Vagrant para desarrollo de puppet

## Introducci�n
La intenci�n de este vagrant es la de desplegar en poco tiempo un entorno de puppet + puppetdb, donde poder realizar el desarrollo de nuevos m�dulos de puppet, teniendo disponible la opci�n de usar los "exported resources".

A ra�z de este repositorio se pueden hacer nuevos �forks�, para a�adir m�s m�quinas a nuestro entorno, o jugar con lo que sea necesario.

Para poder elegir el sistema operativo con el que se quiera trabajar hay dos ficheros de configuraci�n Vagrantfile. Uno es para m�quinas Centos y otro para Ubuntu. En cualquiera de los dos casos los manifiestos de puppet est�n preparados y probados para funcionar con uno o con otro

Por defecto el Vagrantfile inicial es el mismo que el de Centos 6

## Componentes
Esta versi�n inicial consta de dos m�quinas
- puppet1 (192.168.5.15)
- dashboard1 (192.168.5.16)

Los servicios de puppetmaster y de puppetdb est�n contenidos en la primera m�quina. En la segunda est� instalado el servicio puppetboard, que se puede consultar con la URL: http://192.168.5.16

## Instalaci�n

Tan f�cil como bajar este repositorio y ejecutar

```
vagrant up
```

Si queremos usar la versi�n de ubuntu tendremos que sobrescribir el fichero Vagrantfile con el contenido de Vagrantfile_ubuntu

Si queremos a�adir m�s m�quinas para hacer pruebas tendremos que hacer dos cosas:

1. Modificar el fichero Vagrantfile para a�adir otro servidor:

```
  # Maquina personalizada
  config.vm.define :server1 do |server1|
    server1.vm.hostname = "server1.vag.ardemans.int"
    server1.vm.network :private_network, ip: "192.168.5.17"
	server1.vm.provision "shell", inline: "/vagrant/scripts/puppetize.sh"
	server1.vm.provision "puppet_server" do |puppet|
	  puppet.puppet_server = "puppet1.vag.ardemans.int"
	  puppet.options = "--verbose --debug --ssldir=/var/lib/puppet/ssl --waitforcert=5"
	end
  end
```

Teniendo en cuenta el nombre del servidor y la IP que le vamos a asignar. La parte de provisi�n es mejor dejarla como est� para que vaya a buscar las configuraciones al servidor puppet1

2. Editar el fichero "puppet/manifests/nodes.pp" para a�adir el nuevo servidor. Por lo menos deber�a tener algo como esto:

node 'dashboard1.vag.ardemans.int' {

```
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
```

y adem�s lo que se quiera a�adir de m�s, que para eso est� este repositorio.



## Autores

Pedro Miguel Blanco 
   
## Changelog

### v.0.3. 02/04/2014
Compatibilidad con Centos 6
Varios ficheros de configuraci�n Vagrantfile para poder elegir antes del arranque de las m�quinas
Nuevas versiones de los m�dulos de puppet y puppetboard


### v.0.2. 30/03/2014
Se puede consultar puppetboard en el servidor dashboard1 (http://192.168.5.16)

### v.0.1. 28/03/2014
