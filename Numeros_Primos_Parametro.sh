#!/bin/bash


#
#
# Date: 1/7/2016
# Author: Edu Andreu
# Contact: eduardo.andreu.1[at]gmail.com
# Desc: Muestra todos los Valores Primos que se den por parametro, función recursiva que va recorriendo todos los valores.
# Si no hay parametro, nos muestra como debe utilizarse el programa.
#

PAR=1
LIMITE="$1"

if [ $# -ne "$PAR" ] # Check si hay parametros
then
        echo ""
        echo "Usage: `basename $0` number"
        echo ""
  exit
fi

Primos()

{
    (( n = $1 + 1 ))
    shift
    if (( n == LIMITE ))
    then
        echo $*
        return
    fi

    for i; do
        (( i * i > n )) && break
        (( n % i )) && continue
        Primos $n $@
        return
    done

    Primos $n $@ $n
}

Primos 1
