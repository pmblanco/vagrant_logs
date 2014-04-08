# Entorno de pruebas ELK (Elasticsearch - Logstash - Kibana)

## Introducci�n
Entorno de pruebas en local de plataforma de procesado de logs, que petendemos poner en producci�n para nuestros sistemas en Prisa Digital

Este entorno cuenta con: 

* Entorno de puppet (fork del vagrant dedicado a pruebas con puppet para desarrollo de modulos https://pmblanco@bitbucket.org/ardemans/vagrant-puppet-env.git)
** Maquina puppet1 (servidor de puppet + puppetdb)
** M�quina dashboard1 (servidor de puppetboard + apache, desde donde servimos kibana)
* Dos m�quinas de ElasticSearch ES1, ES2 (version 0.90.9)
* M�quina de logs (con servicios redis y logstash 1.3.3)

## Autor
Pedro Miguel Blanco

## Changelog

### logs-v.0.1
Version inicial



