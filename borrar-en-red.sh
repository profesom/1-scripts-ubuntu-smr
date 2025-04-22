#!/bin/bash
HOSTS=("192.168.1.187" "192.168.1.152" "192.168.1.213" "192.168.1.146" "192.168.1.175" "192.168.1.180" "192.168.1.157" "192.168.1.164" "192.168.1.124" "192.168.1.149" "192.168.1.122" "192.168.1.151" "192.168.1.251" "192.168.1.120" "192.168.1.141" "192.168.1.184" "192.168.1.169" "192.168.1.148" "192.168.1.10" "192.168.1.154")
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