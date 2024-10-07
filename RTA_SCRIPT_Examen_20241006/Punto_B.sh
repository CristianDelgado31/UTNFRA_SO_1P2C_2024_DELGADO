#!/bin/bash

# Definir el disco
DISCO_10GB=$(sudo fdisk -l | grep Disk | grep "10 GiB" | awk '{print $2}' | sed 's/://g')

# Crear particiones nuevas
sudo fdisk $DISCO_10GB << PARTICIONES
n
p
1

+1G
n

n
p
2

+1G
n

n
p
3

+1G
n

n
e


n

+1G

n

+1G

n

+1G

n

+1G

n

+1G

n

+1G

n



w
PARTICIONES

# Mostrar las particiones creadas
echo
echo "Mis Particiones: "
sudo fdisk -l $DISCO_10GB

# Formateo de las particiones
echo
echo "Formateo las Particiones: "
sudo fdisk -l $DISCO_10GB | grep $DISCO_10GB | grep -viE 'Disk|exten' | awk '{print "sudo mkfs.ext4 "$1}' | /bin/bash

# Montar las particiones
echo
echo "Monto las Particiones: "
sudo mount ${DISCO_10GB}1 /Examenes-UTN/alumno_1/parcial_1
sudo mount ${DISCO_10GB}2 /Examenes-UTN/alumno_1/parcial_2
sudo mount ${DISCO_10GB}3 /Examenes-UTN/alumno_1/parcial_3
sudo mount ${DISCO_10GB}5 /Examenes-UTN/alumno_2/parcial_1
sudo mount ${DISCO_10GB}6 /Examenes-UTN/alumno_2/parcial_2
sudo mount ${DISCO_10GB}7 /Examenes-UTN/alumno_2/parcial_3
sudo mount ${DISCO_10GB}8 /Examenes-UTN/alumno_3/parcial_1
sudo mount ${DISCO_10GB}9 /Examenes-UTN/alumno_3/parcial_2
sudo mount ${DISCO_10GB}10 /Examenes-UTN/alumno_3/parcial_3
sudo mount ${DISCO_10GB}11 /Examenes-UTN/profesores

# Validar el montaje
echo
echo "Valido montaje: "
df -h | grep datos

# Agregar a /etc/fstab para montaje persistente
echo
echo "Agregando entradas a /etc/fstab"
echo "${DISCO_10GB}1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}3 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}5 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}6 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}7 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}8 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}9 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}10 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO_10GB}11 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
