#!/bin/bash

# Ruta del directorio de salida y archivo
DIRECTORIO_SALIDA="../RTA_ARCHIVOS_Examen_20241006"
ARCHIVO="$DIRECTORIO_SALIDA/Filtro_Avanzado.txt"

VAGRANT_PASS=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

echo "Mi ip publica es: $(curl -s ifconfig.me)" > "$ARCHIVO"

echo "Mi usuario es: vagrant" >> "$ARCHIVO"

echo "El Hash de mi usuario es: $VAGRANT_PASS" >> "$ARCHIVO"

echo "La URL de mi repositorio es: $(git remote get-url origin)" >> "$ARCHIVO"

# Mostrar contendo de Filto_Avanzado.txt
cat $ARCHIVO
