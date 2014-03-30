# Vagrant para desarrollo de puppet

## Introducción
La intención de este vagrant es la de desplegar en poco tiempo un entorno de puppet + puppetdb, donde poder realizar el desarrollo de nuevos módulos de puppet, teniendo disponible la opción de usar los "exported resources".
A raíz de esta repositorio se pueden hacer nuevos “forks”, para añadir más máquinas a nuestro entorno, o jugar con lo que sea necesario.
Esta versión está basada en Ubuntu Precise, pero en futuras versiones los módulos de puppet serán compatibles con Centos

## Componentes
Esta versión inicial consta de dos máquinas
- puppet1 (192.168.5.15)
- dashboard1 (192.168.5.16)

Los servicios de puppetmaster y de puppetdb están contenidos en la primera máquina. En la segunda está instalado el servicio puppetboard, que se puede consultar con la URL: http://192.168.5.16

## Autores

Pedro Miguel Blanco 
   
## Changelog

### v.0.2. 30/03/2014
Se puede consultar puppetboard en el servidor dashboard1 (http://192.168.5.16)

### v.0.1. 28/03/2014
