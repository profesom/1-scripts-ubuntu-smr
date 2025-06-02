#!/bin/bash

# Definimos los usuarios a los que vamos a eliminar los ficheros
USUARIOS=("alumnosmrd" "alumnosmrv" "alumnodiurno" "alumnovespertino")
# Definimos todos los directorios que queremos tocar, en español o inglés
# Los directorios /home/usuario/pruebas y /home/usuario/examen se usarán para las pruebas diarias.
# El directorio: pt es para el packet tracer
# El directorio pruebas y examen los uso para SOM y AOF
DIRECTORIOS=("pepe" "mok" "Instituto" "somexamen" "instalaciones" "EJERCICIOS" "Som" "documentos" "home" "Pictures" "BasedeDatos" "instituto" "mi_directorio" "escritorios" "tutoriales" "som" "SOM" "directorio" "directorio1" "pruebas" "pruebas_SOM" "proyecto" "prueba-permisos" "pt/logs" "pt/saves" "prueba" "examen" "Ejercicios" "ejercicios" "som" "Pruebas" "Imágenes" "Images" "Descargas" "Downloads" "Documentos" "Documents" "Music" "Música" "Trash" "Recientes" "pt" "Vídeos" "Videos" "pruebas" "examen" "Desktop" "Escritorio")

# Iterate over each usuario and each directorio
for usuario in "${USUARIOS[@]}"; do
    for directorio in "${DIRECTORIOS[@]}"; do
        DIR_ACTUAL="/home/$usuario/$directorio"
        if [ -d "$DIR_ACTUAL" ]; then
            if [ "$directorio" != "pt" ]; then
                echo "Borrando el directorio $DIR_ACTUAL ..."
                find "$DIR_ACTUAL" -mindepth 1 -delete
            fi
            # Cambios para el directorio pt
            if [ "$directorio" == "pt" ]; then
                echo "Borrando $DIR_ACTUAL ..."
                find "$DIR_ACTUAL" -type f \( -name "*.pkz" -name "*.pkt" -o -name "*.pka" \) -delete
            fi
            echo "Listo."
        else
            echo "Este directorio $DIR_ACTUAL No existe, nos lo saltamos."
        fi
    done
    # quitando los recientes para cada usuario y esta es la V2 y esta es la modificación desde la WEB
    RECENT_FILES_DIR="/home/$usuario/.local/share"
    if [ -f "$RECENT_FILES_DIR/recently-used.xbel" ]; then
        echo "quitando los ficheros temporales del $usuario..."
        rm -f "$RECENT_FILES_DIR/recently-used.xbel"
        touch "$RECENT_FILES_DIR/recently-used.xbel"
        echo "Listo con los temporales de $usuario."
    fi
    # quitamos los ficheros específicos del home de cada usuario
    HOME_DIR="/home/$usuario"
    echo "quitando los ficheros específicos de $HOME_DIR..."
    # quitamos los ficheros adicionales del /home de cada usuario:
    # actualmente quitamos: pdf, txt, doc, docx, xls, xlsx, ppt, pptx, 
    # actualmente quitamos: odt, odf, ods, .sh, .db, .bd, 
    # actualmente quitamos: pka, pkt, html
    find "$HOME_DIR" -maxdepth 4 -type f \( -name "*.tar" -name "*.pkz" -name "*.save" -o -name "*.pdf" -o -name "*.txt" -o -name "*.doc" -o -name "*.docx" -o -name "*.xls" -o -name "*.xlsx" -o -name "*.ppt" -o -name "*.pptx" -o -name "*.odt" -o -name "*.odf" -o -name "*.ods" -o -name "*.sh" -o -name "*.db" -o -name "*.pka" -o -name "*.html" -o -name "*.pkt" -o -name "*.bd" -o -name "*.js" -o -name "*.css" -o -name "*.png" -name ".odb" \) -delete
    echo "Listo los específicos para $HOME_DIR"

done

echo "Finalizado el script..."