#!/bin/bash

# Crear un directorio "copia" si no existe
mkdir -p copiaFechasCreacion
contador=1

# Usar ls para obtener la lista de archivos y ordenar por fecha de creación
ls -t -U -1 *.jpg | while read -r archivo; do
    nuevo_nombre="copia/$contador.jpg"
        mv "$archivo" "$nuevo_nombre"
	    contador=$((contador + 1))
    done
