#!/bin/bash

# Ruta del directorio de salida y archivo
DIRECTORIO_SALIDA="../RTA_ARCHIVOS_Examen_20241006"
ARCHIVO="$DIRECTORIO_SALIDA/Filtro_Basico.txt"

# Filtramos MemTotal de /proc/meminfo y extraemos el valor en KB
grep MemTotal /proc/meminfo >> "$ARCHIVO"

# Obtener "Chassis Information" y "Manufacturer" con sed
sudo dmidecode -t chassis | grep -iE "Chassis Information|Manufacturer" >> "$ARCHIVO"

# Confirmación de que el archivo ha sido creado y la información agregada
echo "El archivo $ARCHIVO ha sido creado con la información solicitada."
cat $ARCHIVO
echo

