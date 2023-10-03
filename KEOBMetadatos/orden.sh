#!/bin/bash

# Obtener una lista de archivos con fecha de captura
mapfile -t archivos < <(exiftool -s3 -d "%Y%m%d%H%M%S" -DateTimeOriginal -ext jpg -q -p "$FileName" .)

# Filtrar los archivos sin fecha de captura
archivos_con_fecha=()
for fecha_captura in "${archivos[@]}"; do
    if [ -n "$fecha_captura" ]; then
        archivos_con_fecha+=("$fecha_captura")
    fi
done

# Ordenar la lista por fecha de captura
IFS=$'\n' sorted=($(sort <<<"${archivos_con_fecha[*]}"))

# Contador para los nombres de archivo
contador=1

# Iterar sobre la lista ordenada y renombrar los archivos
for fecha_captura in "${sorted[@]}"; do
    if [ -n "$fecha_captura" ]; then
        nuevo_nombre="$contador.jpg"
        mv "$fecha_captura" "$nuevo_nombre"
        contador=$((contador + 1))
    fi
done

# Imprimir la lista ordenada (opcional)
for fecha_captura in "${sorted[@]}"; do
    echo "$fecha_captura"
done
