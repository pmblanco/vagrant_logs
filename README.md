# Vagrant para desarrollo de puppet

## Introducción
La intención de este vagrant es la de desplegar en poco tiempo un entorno de puppet + puppetdb, donde poder realizar el desarrollo de nuevos módulos de puppet, teniendo disponible la opción de usar los "exported resources".
A raíz de esta repositorio se pueden hacer nuevos “forks”, para añadir más máquinas a nuestro entorno, o jugar con lo que sea necesario.
Esta versión está basada en Ubuntu Precise, pero en futuras versiones los módulos de puppet serán compatibles con Centos

## Componentes
Esta versión inicial consta de dos máquinas
- puppet1 (192.168.5.15)
- dashboard1 (192.168.5.16)

Los servicios de puppetmaster y de puppetdb están contenidos en la primera máquina. En la segunda, aunque se llama dashboard, de momento solo tiene instalado el agente de puppet y configurado para poder ejecutarse contra el master en cualquier momento. En un futuro es muy probable que tenga un dashboard para poder ver de forma fácil los resúmenes de los reports que se vayan generando. 
   
## Autores

Pedro Miguel Blanco 
   
## Changelog

### v.0.1. 28/03/2014
