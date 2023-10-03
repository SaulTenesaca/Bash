#!/bin/bash
mkdir -p copia
contador=1
ls -S *.jpg | while read -r archivo; do
    nuevo_nombre="copia/$contador.jpg"
        mv "$archivo" "$nuevo_nombre"
	    contador=$((contador + 1))
done
