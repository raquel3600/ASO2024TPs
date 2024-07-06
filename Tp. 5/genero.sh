#!/bin/bash

#Ingresar nombre
read -p "Por favor, ingrese un nombre: " nombre

#Validación de nombre
if [ -z "$nombre" ]; then
    echo "No se ha ingresado un nombre válido."
    exit 1
fi

URL="https://api.genderize.io?name=${nombre}"

response=$(curl -s "$URL")

#Validación género
if [ $? -ne 0 ]; then
    echo "No se pudo obtener información del género"
    exit 1
fi

name=$(echo "$response" | jq -r '.name')
gender=$(echo "$response" | jq -r '.gender')
probability=$(echo "$response" | jq -r '.probability')

case "$gender" in
    female)
        gender="Femenino"
;;
    male)
        gender="Masculino"
;;
    *)
        gender="Desconocido"
;;
esac

pc_probabilidad=$(echo "scale=2; $probability * 100" | bc)

# Muestra los resultados obtenidos
echo "Nombre: $name"
echo "Género: $gender"
echo "Probabilidad: ${pc_probabilidad}%"
