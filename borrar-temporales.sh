#!/bin/bash

# Definimos los usuarios a los que vamos a eliminar los ficheros
USUARIOS=("alumnosmrd" "alumnosmrv")
# Definimos todos los directorios que queremos tocar, en español o inglés
# El directorio: pt es para el packet tracer
# El directorio pruebas y examen los uso para SOM y AOF
DIRECTORIOS=("Imágenes" "Images" "Descargas" "Downloads" "Documentos" "Documents" "Music" "Música" "Trash" "Recientes" "pt" "Vídeos" "Videos" "pruebas" "examen" "Desktop" "Escritorio")

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
                find "$DIR_ACTUAL" -type f \( -name "*.pkt" -o -name "*.pka" \) -delete
            fi
            echo "Listo."
        else
            echo "Este directorio $DIR_ACTUAL No existe, nos lo saltamos."
        fi
    done
    # quitando los recientes para cada usuario y esta es la V2
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
    find "$HOME_DIR" -maxdepth 1 -type f \( -name "*.pdf" -o -name "*.txt" -o -name "*.doc" -o -name "*.docx" -o -name "*.xls" -o -name "*.xlsx" -o -name "*.ppt" -o -name "*.pptx" -o -name "*.odt" -o -name "*.odf" -o -name "*.ods" -o -name "*.sh" -o -name "*.db" -o -name "*.pka" -o -name "*.html" -o -name "*.pkt" -o -name "*.bd" \) -delete
    echo "Listo los específicos para $HOME_DIR"

done

echo "Finalizado el script..."



