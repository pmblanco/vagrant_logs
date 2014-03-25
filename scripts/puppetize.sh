#!/bin/bash

# Añadimos el servidor de puppet en el /etc/hosts
echo "192.168.5.15 puppet1.vag.ardemans.int" >> /etc/hosts

# Lo primero que hacemos es poner en hora el servidor
service ntp stop
ntpd -gq
service ntp start

# Ejecutamos el agente de puppet
# puppet agent --server=puppet1.vag.ardemans.int --verbose --debug