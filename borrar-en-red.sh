#!/bin/bash
USERNAME="profesor"
CMD1="sudo ls -lh /home/alumnosmrd/"
CMD2="sudo ls -lh /home/alumnosmrv/"

LOCALSCRIPT="borrar-temporales.sh"
REMOTEPATH="/tmp/borrar-temporales.sh"
CMD3="/tmp/borrar-temporales.sh"

conexiones=0
total_pcs_1smr=21

for ((puesto=51; puesto<72; puesto++)); do
	ip="192.168.1.$puesto"
	echo "_________**para $ip ahora**_____________"
	echo "conectamos con $ip"
	scp "$LOCALSCRIPT" "$USERNAME@$ip:$REMOTEPATH"
	echo "hacemos $USERNAME@$ip"
	ssh "$USERNAME@$ip" "sudo $CMD3"
	((conexiones++))
	echo "---------__finalizado $ip__-------------"
done

# echo "Nos quedan $pendientes pcs por limpiar"