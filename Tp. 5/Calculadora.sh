#!/bin/bash


#Seleccionar operacion
echo "Menú:"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicación"
echo "4. División"
echo -n "Seleccione la operación a realizar: "

read opcion

#Ingresar dos números
echo -n "Ingrese el primer número:"
read num1
echo -n "Ingrese el segundo número:"
read num2

#Realizar la operacion
case $opcion in

1) resultado=`echo $num1 + $num2 | bc`
;;

2) resultado=`echo $num1 - $num2 | bc`
;;

3) resultado=`echo $num1 \* $num2 | bc`
;;

4) if [ "$num2" -eq 0 ]; then
       echo "ERROR: no se puede dividir por 0"
   else
     resultado=`echo $num1 / $num2 | bc`
   fi
;;

esac

echo "resultado: $resultado"
