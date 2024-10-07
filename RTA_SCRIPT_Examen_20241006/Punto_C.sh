#!/bin/bash

# Creación de grupos
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Obtener la contraseña cifrada de vagrant
VAGRANT_PASS=$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')

# Creación de usuarios con la misma contraseña que vagrant
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores p1c2_2024_P1

# Asignar la misma contraseña que vagrant a los nuevos usuarios
echo "p1c2_2024_A1:$VAGRANT_PASS" | sudo chpasswd
echo "p1c2_2024_A2:$VAGRANT_PASS" | sudo chpasswd
echo "p1c2_2024_A3:$VAGRANT_PASS" | sudo chpasswd
echo "p1c2_2024_P1:$VAGRANT_PASS" | sudo chpasswd


#Ajustar los permisos para determiandas carpetas
sudo chmod 750 /Examenes-UTN/alumno_1
sudo chmod 760 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_3
sudo chmod 775 /Examenes-UTN/profesores

#Cambiar de propietario
sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores


# Crear el archivo 'validar.txt' con la salida de 'whoami' en las respectivas carpetas
# Para el alumno 1
sudo -u p1c2_2024_A1 whoami > /Examenes-UTN/alumno_1/validar.txt
sudo -u p1c2_2024_A2 whoami > /Examenes-UTN/alumno_2/validar.txt
sudo -u p1c2_2024_A3 whoami > /Examenes-UTN/alumno_3/validar.txt
sudo -u p1c2_2024_P1 whoami > /Examenes-UTN/profesores/validar.txt

