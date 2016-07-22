
#!/bin/bash
#
# RandomNumbers
# Date: 6/6/2016
# Author: Edu Andreu
# Contact: eduardo.andreu.1[at]gmail.com
# Desc: Random Numbers between 0-99999 y Serie Random (0-999)
# Tambien puede simular una loteria.
#

flag=0

while [ $flag -eq 0 ]
do
        echo "¿How many random numbers do you like to show?"
        read number

        if [ $number -le 0 ] || [ $number -ge 10000 ]; then
                echo "Are you kidding me?"
                echo "Maybe is too much for my: "
                dmidecode | grep Version: | grep CPU
                echo " Try again, please."
        else
                flag=1;
        fi
done
echo "-------------------------------------------------"

for (( i=1; i<=$number; i++))
        do
                for (( j=1; j<=$number; j++ ))
                do
                Serie=$(( ( RANDOM % 900 ) + 100 ))
                done
                #Si elegimos menos de 10 o 10 numeros, los mostrara de uno a uno, si elegimos mas, los mostrara todos de golpe.
                if [ $number -le 10 ]; then
                sleep 1
                echo "Random Number $i and Serie: " $(( ( RANDOM % 99999 ) + 1 )) $Serie
                else
                echo "Random Number $i and Serie: " $(( ( RANDOM % 99999 ) + 1 )) $Serie
                fi

        done
