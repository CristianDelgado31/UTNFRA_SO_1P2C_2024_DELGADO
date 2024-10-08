#!/bin/bash

# Crear el directorio principal
mkdir -p Estructura_Asimetrica/correo
mkdir -p Estructura_Asimetrica/clientes

# Crear los archivos cartas_1 a cartas_100 en ambas carpetas
for i in {1..100}; do
  touch Estructura_Asimetrica/correo/cartas_$i
  touch Estructura_Asimetrica/clientes/cartas_$i
done

# Crear los archivos carteros_1 a carteros_10 en la carpeta correo
for i in {1..10}; do
  touch Estructura_Asimetrica/correo/carteros_$i
done

# Comando de validación (mostrar la estructura de directorios)
tree Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4


