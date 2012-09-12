#!/bin/bash
# Register an host in dynamic DNS 
# Proven with MS AD DNS service (this is NOT an dyndns.org updater!!!)

LANG=C  # Avoid localization! Sometimes break everything

HOST=$(hostname) 

IPADD=$(ifconfig eth0 | awk '/inet\ addr:/{split($2,array,":") ; print array[2]}')

SERVER="YOUR DNS SERVER IP ADDR"

DOMAIN="YOUR.DOMAIN.NAME"

nsupdate << EOF
server  $SERVER
zone $DOMAIN
update delete $HOST.$DOMAIN. A
update add $HOST.$DOMAIN.es. 86400 A $IPADD
send
EOF
