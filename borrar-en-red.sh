#!/bin/bash
HOSTS=("192.168.1.123" "192.168.1.156" "192.168.1.10" "192.168.1.164" "192.168.1.141" "192.168.1.120" "192.168.1.251" "192.168.1.124" "192.168.1.153" "192.168.1.148" "192.168.1.119" "192.168.1.128" "192.168.1.129" "192.168.1.125" "192.168.1.118" "192.168.1.149" "192.168.1.146" "192.168.1.154" "192.168.1.152" "192.168.1.131" "192.168.1.122")
USERNAME="profesor"
CMD1="sudo ls -lh /home/alumnosmrd/"
CMD2="sudo ls -lh /home/alumnosmrv/"

LOCALSCRIPT="borrar-temporales.sh"
REMOTEPATH="/tmp/borrar-temporales.sh"
CMD3="/tmp/borrar-temporales.sh"

for HOST in "${HOSTS[@]}"; do
	echo "_________**para $HOST ahora**_____________"
	echo "conectamos con $HOST"
	scp "$LOCALSCRIPT" "$USERNAME@$HOST:$REMOTEPATH"
	echo "hacemos $USERNAME@$HOST"	
	ssh "$USERNAME@$HOST" "sudo $CMD3" 
	echo "---------__finalizado $HOST__-------------"
done