#!/bin/bash
#
############################NOT FINISHED############################
#
# Author: Edu Andreu
# Email: edandreu@ucm.es
# Version 1.4.1
# Description: EpicCalc! 
# Date: 6/6/16
#

###################################################################    RESERVED TO FUNCTIONS
#
#Funcion Comprobacion Numeros
#Comprueba si los Operandos son Numeros, si no lo son, los pide nuevamente.
#

###################################################################    FUNCIONES DE CHECKING

###################################################################    COMPROBACION PARA LOS NUMEROS (Vale para cualquier funcion del menu)
fCheckNumber(){

onlyNumber="^[0-9]+$"
local number=$1

        if ! [[ $number  =~ $onlyNumber ]]
        then

                if [ $opmenu -eq 0 ]
                then
                echo "Por favor inserte dos operadores numericos"
                calcsimple
                fi

                if [ $opmenu -eq 1 ]
                then
                echo "Debe Insertar un numero"
                primo
                fi

                if [ $opmenu -eq 2 ]
                then
                bisiesto
                fi

                if [ $opmenu -eq 10 ]
                then
                euler
                fi

                if [ $opmenu -eq 12 ]
                then
                fibonacci
                fi

                if [ $opmenu -eq 99 ]
                then
                calcsimple
                primo
                bisiesto
                fibonacci
                euler
                fi
        else
        clear
        fi

}

###################################################################    COMPROBACION PRA LAS RESPUESTA DE SI Y NO
fAgain(){
local again=$1
if   [ $again=="Y" ] || [ $again=="y" ]
then
        echo "Regresando al Menu"
        sleep 2
        menu
else
        bisiesto
fi
}

###################################################################    FUNCION PARA OBTENER FACTORIALES
fFactorial(){

factorial=$1
resultado=1
posicion=0

echo "Calculando el factorial de $factorial!"

while [ $factorial -gt 1 ]
do
 let resultado=$resultado*$factorial
 let factorial-=1
 let posicion+=1
 echo ""
 echo "$posicionº Factorial: $resultado"
done
return $resultado
}

###################################################################    FUNCIONES ESPECIFICAS DEL MAIN

###################################################################    MENU
menu(){
echo "*************************************************"
echo "*                  EPIC CALC                    *"
echo "*                                               *"
echo "*                   - MENU -                    *"
echo "*                 NOT FINISHED                  *"
echo "*                                               *"
echo "*************************************************"
echo "*                                               *"
echo "* 0. Calculadora Simple     *DONE*              *"
echo "* 1. Calcular Primo         *DONE*              *"
echo "* 2. Año Bisiesto           *DONE*              *"
echo "* 3. Calcular Areas (2D)                        *"
echo "* 4. Calcular Areas (3D)                        *"
echo "* 5. Calcular Volumen                           *"
echo "* 6. Calculo Precio con/sin Impuestos(IVA|VAT)  *"
echo "* 7. Calculadora de Fracciones                  *"
echo "* 8. Calculadora de Factoriales                 *"
echo "* 9. Calculadora de Factorizacion               *"
echo "*10. Numeros de Euler           *DONE*          *"
echo "*11. Numeros de Bernoulli       *DONE*          *"
echo "*12. Numeros de Fibonacci       *DONE*          *"
echo "*13. Combinatoria               *INPROGRESS*    *"
echo "*14. Estadistica                                *"
echo "*15. Funcion Gamma                              *"
echo "*16. Simplificador de Expresiones               *"
echo "*17. Calculadora Derivadas                      *"
echo "*18. Calculadora Integrales                     *"
echo "*19. Calculadora Limites                        *"
echo "*20. Calculadora Series                         *"
echo "*21. Calculadora Ecuaciones                     *"
echo "*22. Series de Taylor                           *"
echo "*                                               *"
echo "* A. Acerca de...             *INPROGRESS*      *"
echo "* C. Creditos                 *DONE*            *"
echo "* X. Salir                    *DONE*            *"
echo "*                                               *"
echo "*************************************************"
echo " "
echo " ¿Que quieres hacer? "
read opmenu
clear

}

###################################################################    0- Calculadora Simple
calcsimple(){

flagcalcsimple=0

echo "Introduce el Primer Operando"
read oper1

#Comprobacion Operando 1
fCheckNumber $oper1

echo "Introduce el Segundo Operando"
read oper2

#Comprobacion Operando 2
fCheckNumber $oper2

while [ $flagcalcsimple -eq "0" ]
do
        echo "Elige Operador"
        echo " "
        echo "1. Suma ( $oper1 + $oper2 = ? )"
        echo "2. Resta ( $oper1 - $oper2 = ? )"
        echo "3. Multiplicacion ( $oper1 * $oper2 = ? )"
        echo "4. Division Simple ( $oper1 / $oper2 = ? )"
        echo "5. Potencia ( $oper1 ^ $oper2 = ? )"
        echo "6. Todas las Operaciones"
        echo "7. Seleccionar otros Operandos"
        echo "0. Regresar al Menu"
        echo "------------------------------------------"
        echo ""
        read opcalcsimple
        case "$opcalcsimple" in

                1)
                echo ""
                echo "$oper1 + $oper2 = $(($oper1+$oper2))"
                echo ""
                ;;

                2)
                echo ""
                echo "$oper1 - $oper2 = $(($oper1-$oper2))"
                echo ""
                ;;

                3)
                echo ""
                echo "$oper1 * $oper2 = $(($oper1*$oper2))"
                echo ""
                ;;

                4)
                #Comprobacion 0 en el Divisor
                if [ $oper2 -eq 0 ]
                then
                        echo ""
                        echo "Esta operacion no puede realizarse, dado que el Divisor es 0"
                        echo "Operacion Anulada"
                        echo ""
                else
                echo ""
                echo "$oper1 / $oper2 = $(($oper1/$oper2))"
                echo ""
                fi
                ;;

                5)
                echo ""
                aux=$oper1
                for ((i=1;i<$oper2;i++))
                do
                aux=$(($aux*$oper1))
                done
                echo "$oper1 ^ $oper2 = $aux"
                echo ""
                ;;

                6)
                clear
                echo "Todas las Operaciones"
                echo ""
                echo "+: $oper1 + $oper2 = $(($oper1+$oper2))"
                echo "-: $oper1 - $oper2 = $(($oper1-$oper2))"
                echo "*: $oper1 * $oper2 = $(($oper1*$oper2))"
                if [ $oper2 -eq 0 ]
                then
                        echo ""
                        echo "Esta operacion no puede realizarse, dado que el Divisor es 0"
                        echo "Operacion Anulada"
                        echo ""
                else
                echo "/: $oper1 / $oper2 = $(($oper1/$oper2))"
                aux=$oper1
                for ((i=1;i<$oper2;i++))
                do
                aux=$(($aux*$oper1))
                done
                echo "^: $oper1 ^ $oper2 = $aux"
                echo "----------------------------------------------------------------"
                echo ""
                fi
                ;;

                7)
                clear
                echo ""
                echo "Antes seleccionaste los Operandos:"
                echo " "
                echo "1er Op: $oper1."
                echo "2do Op: $oper2."
                sleep 2
                clear
                calcsimple
                ;;

                0)
                flagcalcsimple=1
                menu
                ;;
                *)
                clear
                echo "Error. Selecciona una de las opciones posibles."
                ;;
        esac
done

}

###################################################################    1- Numero Primo o Rango de Primos
primo (){

clear
echo "1) ¿Quieres comprobar un numero?"
echo "2) ¿O quieres comprobar los primos de un rango?"
echo ""
read opprimo

if [ $opprimo -eq "2" ]
then

        echo ""
        echo "Elija dos numeros para el rango"
        read num1
        fCheckNumber $num1
        if [ $num1 -le "1" ]
        then
                echo ""
                echo "Error, debe ser mayor que 1"
                echo ""
                echo "Regresando al Menu - Primo"
                sleep 3
                primo
        fi

        echo "Ha elegido el $num1, debe elegir un segundo numero mayor que $num1"
        read num2
        fCheckNumber $num2
        if [ $num2 -lt $num1 ]
        then
                echo ""
                echo "Error. El Segundo numero debe ser mayor o igual que $num1."
                echo ""
                echo "Regresando al Menu - Primo"
                sleep 3
                primo
        fi

        echo "Ha elegido los numeros: $num1 y $num2"
        echo "A continuacion se muestran los primos entre $num1 y $num2, inclusive"
        echo ""

        for x in $(seq $num1 $num2)
        do
                primo=1
                y=2
                while [ $y -lt $x ]
                do
                        resto=$[$x%$y]
                        if [ $resto -eq 0 ]
                        then
                                primo=0
                        fi
                        y=$[$y+1]
                done
                if [ $primo -eq 1 ]
                then
                        echo $x ", es primo."
                else
                        echo $x ", no es primo."
                fi
        done
        echo ""

else

        echo "Elija el numero a comprobar"
        read num1
        fCheckNumber $num1

        for x in $(seq $num1 $num1)
        do
                primo=1
                y=2
                while [ $y -lt $x ]
                do
                        resto=$[$x%$y]
                        if [ $resto -eq 0 ]
                        then
                                primo=0
                        fi
                        y=$[$y+1]
                done
                if [ $primo -eq 1 ]
                then
                        echo $x ", es primo."
                else
                        echo $x ", no es primo."
                fi
        done


fi



}

###################################################################    2- Año Bisiesto (0-9999)
bisiesto(){
clear
echo "Por favor introduce un año. (YYYY)"
read year
fCheckNumber $year

#Comprobamos que el numero este entre 0 y 9999, inclusives.
if [ $year -lt 0 ] | [ $year -gt 9999 ]
then
        echo "Debe Insertar una fecha valida (0-9999)"
        sleep 3
        bisiesto
fi


if [ $(($year%2)) == 0 ]
then
        echo ""
        echo "El año elegido ($year), es Bisiesto"
        echo "El año anterior fue: " $(($year-4))
        echo "El proximo año sera: " $(($year+4))
        echo ""
else
        echo ""
        echo "Ese año no es bisiesto ($year)"
        echo ""
fi

echo "¿Quiere probar de nuevo? (Y/N)"
read againyear
fAgain $againyear

}

###################################################################   10 - Euler
euler(){

suma=0
echo ""
echo "Por favor, escriba dos numeros para el rango que mostrara de los Numeros Euler"
echo ""
read num1
fCheckNumber $num1
echo "Un numero mas, Gracias."
read num2
        if [ $num2 -lt $num1 ]
        then
                echo ""
                echo "Error. El Segundo numero debe ser mayor o igual que $num1."
                echo ""
                echo "Regresando al Menu - Euler"
                sleep 3
                euler
        fi
fCheckNumber $num2

printf "%4s\t%8s\n" "Numero" "Suma"
for i in $(seq $num1 $num2)
do
if [[ $((i%3)) -eq 0 ]] || [[ $((i%5)) -eq 0 ]]
then suma=$((suma+i))
# One line for each found number and sum progress
printf "%4s\t%8s\n" $i $suma
# Single line, overwritten at each found number
#printf "\r%4s\t%8s" $i $sum
# Makes sense in combination with
# single line output to show progress
#sleep 0.02
fi
done
#echo $sum #final result
exit


}

###################################################################   11 - Bernoulli FALTA
#bernoulli(){
#if (( $1 < 3 ))
#   then
#      echo 1
# else
#    echo $(( $(bernoulli $(( $1 - 1 ))) + $(bernoulli $(( $1 - 2 ))) ))
#fi
#}


###################################################################   12 - Serie Fibonacci
fibonacci(){

flag=0
while [ $flag -eq 0 ]
do

        echo "¿Cuantos numeros de la sucesion quieres mostrar?"
        read rangofibo
        fCheckNumber $rangofibo

        if [ $rangofibo -le 3 ] || [ $rangofibo -ge 90 ]
        then
                echo "El rango debe estar entre 3 y 90"
                echo "Elige un rango aceptable"
        else
        flag=1
        fi
done

fs0=0
fs1=1
clear
for (( i=1;i<=$rangofibo;i++ ))
do
        echo "Numero $i de la Sucesion de Fibonacci: "
        echo "$fs1, "
        fsn=$((fs0+fs1))
    fs0=$fs1
        fs1=$fsn
done







}

###################################################################   13 - Combinatoria

menucombinatoria(){

flag=0

while [ $flag -eq 0 ]
do

clear
echo "***************************************************************"
echo "*                                                             *"
echo "*                          Menu - Combinatoria                *"
echo "*                                                             *"
echo "*-------------------------------------------------------------*"
echo "*                 Permutaciones (El Orden Importa)            *"
echo "*                 Combinaciones (El Orden NO Importa)         *"
echo "*-------------------------------------------------------------*"
echo "* 1) Permutaciones Sin Repeticion                             *"
echo "* 2) Permutaciones Con Repeticion                             *"
echo "* 3) Combinaciones Sin Repeticion                             *"
echo "* 4) Combinaciones Con Repeticion                             *"
echo "* 5) Variaciones   Sin Repeticion                             *"
echo "* 6) Variaciones   Con Repeticion                             *"
echo "* 0) Regresar al Menu Principal                               *"
echo "***************************************************************"
echo ""
echo "Seleccione una Opcion"
read answercomb

case "$answercomb" in

1)
clear
PermutacionesSinRepeticion
;;
2)
clear
PermutacionesConRepeticion

;;
3)
clear
CombinacionesSinRepeticion
# echo "Ejemplo"
# echo ""
# echo "En una clase de 35 alumnos se quiere elegir un comité formado por tres alumnos. ¿Cuántos comités diferentes se pueden formar?"
# echo "Cn|m= m!/n!(m-n)!"
# echo "Tip (Recuerda): No entran todos los elementos, No importa el orden, NO se repiten"
# echo "C3|35= 35!/3!(35-3)!"
# echo ""
# echo "Solucion: 35·34·33·32! / 3·2·1(32)! => 35·34·33/3·2·1 => 39270 / 6 => 6545"
# echo ""
# echo ""
;;
4)
clear
CombinacionesConRepeticion
# echo "Ejemplo"
# echo ""
# echo "En una bodega hay en un cinco tipos diferentes de botellas. ¿De cuántas formas se pueden elegir cuatro botellas?"
# echo "CRn|m=(m+n-1)!/n!(m-1)!"
# echo "Tip (Recuerda): No entran todos los elementos, No importa el orden, SI se repiten"
# echo "CR4|5=(5+4-1)!/4!(5-1)!"
# echo ""
# echo "Solucion: 8!/4!·4! => 8·7·6·5·4!/4!·4·3·2·1 => 1680 · 4! / 24 · 4! => 1680 / 24 => 70 "
# echo ""
# echo ""
;;
5)
clear
VariacionesSinRepeticion
# echo "Ejemplo"
# echo ""
# echo "Cuantas palabras distintas de cuatro letras podemos formar con las letras r,m,o,a,d,s"
# echo "Vn|m= m!/(m-n)!"
# echo "Tip (Recuerda): No entran todos los elementos, SI importa el orden, NO se repiten"
# echo "V4|6=6!/(6-4)!"
# echo ""
# echo "Solucion: V4|6=6·5·4·3·2!/2! => 360 ·2!/2! => 360 "
# echo ""
# echo ""
;;
6)
clear
VariacionesConRepeticion
# echo "Ejemplo"
# echo ""
# echo "Cuantas palabras distintas de cuatro letras podemos formar con las letras r,m,o,a,d,s"
# echo "VRn|m=m^n"
# echo "Tip (Recuerda): No entran todos los elementos, SI importa el orden, SI se repiten"
# echo "V4|6=6^4"
# echo ""
# echo "Solucion: V4|6=6^4 => 1296 "
# echo ""
# echo ""
;;
0)
echo ""
echo "Regresando al Menu Principal"
echo ""
sleep 3
flag=1
menu
;;

esac
done

}

###################################################################   13.1 Permutaciones SIN Repeticion

PermutacionesSinRepeticion(){
P=1
echo "Definicion: Se llama permutaciones de m elementos (m = n) a las diferentes agrupaciones de esos m elementos."
echo ""
echo "Ejemplo"
echo ""
echo "Cuantas palabras podemos formar con 5 letras"
echo "Pn=n!"
echo "Tip (Recuerda): SI entran todos los elementos, SI importa el orden, NO se repiten"
echo ""
echo "P5=5!"
echo ""
echo "Solucion: P5=5·4·3·2·1 => 120"
echo ""
echo ""
read -p "Inserte el numero de Permutaciones Sin Repeticion del que desea obtener el resultado:  " PSR
fCheckNumber $PSR
echo ""
echo "Calculando las Permutaciones Sin Repeticion de P$PSR=$PSR!"
echo ""
fFactorial $PSR
echo ""
sleep 3
echo "Las Permutaciones sin Repeticion de $PSR son $resultado."
echo ""
echo "Volviendo al Menu"
sleep 5

}
###################################################################   13.2 Permutaciones CON Repeticion

PermutacionesConRepeticion(){
P=1
echo "Definicion: Permutaciones con repetición de n elementos donde el primer elemento se repite a veces ,"
echo "el segundo b veces , el tercero c veces, ..."
echo ""
echo "Ejemplo"
echo ""
echo "En nuestra coleccion de musica tenemos 2 Discos de Clasica (a), 4 Discos de Rock (b), y 3 Discos de hip Hop (c)."
echo "¿Cuantas mezclas podriamos hacer si juntaramos los 9 Discos (m)?"
echo "PRa,b,c|m= m!/a!·b!·c!"
echo "Tip (Recuerda): SI entran todos los elementos, SI importa el orden, SI se repiten"
echo "PR2,4,3|9 = 9! / 2!·4!·3!"
echo ""
echo "Solucion: 362880/288 => 1260"
echo ""
echo ""
read -p "Inserte el el numero de elementos: " E_PCR
fCheckNumber $E_PCR
for (( i=0, i<=$E_PCR, i++ ))
do
let E_PCR-=1
read -p "Inserte el numero del $E_PCR elemento: " A_PCR
fCheckNumber $A_PCR


done


echo ""
echo "Calculando las Permutaciones Sin Repeticion de P$PSR=$PSR!"
echo ""
fFactorial $PCR
echo ""
sleep 3
echo "Las Permutaciones sin Repeticion de $PSR son $resultado."
echo ""
echo "Volviendo al Menu"
sleep 5










}
###################################################################   13.3 Combinaciones SIN Repeticion

#CombinacionesSinRepeticion(){
#}
###################################################################   13.4 Combinaciones CON Repeticion

#CombinacionesSinRepeticion(){
#}
###################################################################   13.5 Variaciones SIN Repeticion

#VariacionesSinRepeticion(){
#}
###################################################################   13.5 Variaciones CON Repeticion

#VariacionesConRepeticion(){
#}




###################################################################    C - Creditos
creditos(){
echo " Agradecimientos  especiales a: "
echo " "
sleep 1
echo " AndreuTech.com "
sleep 1
echo " Palomatica.info "
sleep 1
echo " NumberEmpire.com "
echo " "
sleep 2
echo " Otros Agradecimientos: "
echo " "
echo " ShellCalc.com "
echo " Stackoverflow.com User: jiaaro"
echo " ScorporoIva.it "
echo " Tldp.org "
echo " ExplainShell.com "
sleep 1
echo " Linus Torvalds "
sleep 1
echo " Richard Stallman "
sleep 5
clear
}

###################################################################    X - Exit
out(){

sleep 5
clear
echo "Salir en 5..."
sleep 1
clear
echo "Salir en 4..."
sleep 1
clear
echo "Salir en 3..."
sleep 1
clear
echo "Salir en 2..."
sleep 1
clear
echo "Salir en 1..."
sleep 1
clear

}

###################################################################    MAIN - Debe ser la ultima Funcion, pues llama al resto de ellas.
###################################################################    (El codigo puede hacerse perfectamente sin esta funcion,
###################################################################    pero para que quede mas recogido el codigo en un editor de texto.
main(){

flag=0
while [ $flag -eq 0 ]
do
        menu
        case "$opmenu" in
        #Calculadora Simple
                0)
                calcsimple
                ;;
                #Primo
                1)
                primo
                ;;
                #Bisiesto
                2)
                bisiesto
                ;;
                #Areas 2D
                3)
                echo " Sobre que figura Geometrica debemos obtener el Area? "
                menuarea2d
                ;;
                #Areas 3D
                4)
                echo " Sobre que figura Geometrica debemos obtener el Area? "
                menuarea3d
                ;;
                #Volumenes
                5)
                echo " Sobre que figura Geometrica debemos obtener el Volumen? "
                menuvolumen
                ;;
                #IVA
                6)
                menuiva
                ;;
                #Fracciones
                7)
                fracciones
                ;;
                #Factorial
                8)
                factorial
                ;;
                #Factorizacion
                9)
                factorizacion
                ;;
                #Euler
                10)
                euler
                ;;
                #Bernoulli
                11)
                bernoulli
                ;;
                #Fibonacci
                12)
                fibonacci
                ;;
                #Combinatoria
                13)
                menucombinatoria
                ;;
                #Estadistica
                14)
                menuestadistica
                ;;
                #Gamma
                15)
                gamma
                ;;
                #Expresiones
                16)
                expresiones
                ;;
                #Derivadas
                17)
                derivadas
                ;;
                #Integrales
                18)
                integrales
                ;;
                #Limites
                19)
                limites
                ;;
                #Series
                20)
                series
                ;;
                #Ecuaciones
                21)
                ecuaciones
                ;;
                #Taylor
                22)
                taylor
                ;;
                99)
                calcsimple
                primo
                bisiesto
                fibonacci
                euler
                ;;
                #Acerca de
                A|a)
                about
                ;;
                #CREDITOS
                C|c)
                creditos
                ;;
                #SALIR
                X|x)
                echo "Gracias, por utilizar este programa"
                out
                flag=1
                break
                ;;
                #OTRO | ERROR
                *)
                ;;
        esac
done
}


main
