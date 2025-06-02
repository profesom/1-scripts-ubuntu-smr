#! /bin/bash

#el script está pensado para 1 usuario y conociendo la ip destino

#el usuario que hace login en el equipo remoto tiene que estar bien configurado
#con los cambios en el remoto en el /etc/sudoers, 
#cambiar la línea de root privileges con: %usuario ALL=(ALL) NOPASSWD: ALL
#cambiar la línea de includes con: usuario ALL=(ALL) NOPASSWD: ALL

#este es el usuario al que cambiamos la pass
usuario_remoto=profesor

#este sería el login remoto, mejor dejarlo como "profesor", que ya está bien configurado
nueva_password=Karpant@7

#este sería el login que usamos en el remoto
login_remoto=profesor@192.168.1.122

echo "este es el usuario al que cambio el pass"
echo $usuario_remoto
echo "esta será la nueva password"
echo $nueva_password
echo "este será el login que usamos"
echo $login_remoto

#ejecutamos
ssh "$login_remoto" "echo '$usuario_remoto:$nueva_password' | sudo chpasswd"