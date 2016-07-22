#!/bin/bash
#
#
# Aviation & NATO CODE Bash
# Date: 15/7/2016
# Author: Edu Andreu 
# Contact: eduardo.andreu.1[at]gmail.com
# Desc: A simple program that convert Alphabet to Aviation Code & NATO
# Update 1.1: Added a Exit, with 'exit' command.
# 

echo "--------------------------------USAGE---------------------------------------"
echo "| Write whatever you want with CAPS ON, it will be translated to NATO Code.|"
echo "| If you want to exit, write 'exit' in lower caps.			 |"
echo "----------------------------------------------------------------------------"
echo ""
 
for ((i=48; i<90; i++)); do
ascii="$ascii$(echo -en $(printf "%s%o" "\\" "$i"))"
done

# English Alphabet: Chars that can be translated

eng="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# The aviation code for each character in english
code=( 
# Numbers 0-9
0 1 2 3 4 5 6 7 8 9
# alphabet A-Z NATO CODE
ALPHA BRAVO CHARLIE DELTA ECHO FOXTROT GOLF HOTEL INDIA JULIET KILO LIMA MIKE NOVEMBER OSCAR
PAPA QUEBEC ROMEO SIERRA TANGO UNIFORM VICTOR WHISKY XRAY YANKEE ZULU )

while read -a line; do

# Update1.1 Added a escape command with 'exit' word. 
if [ ${line[@]} == "exit" ]
then
exit
else

# Convert Your texting in NATO CODE
for i in "${line[@]}"; do
for (( j=0; j<${#i}; j++ )); do

if  [ "${eng/${i:$j:1}/}" == "$eng" ]; then
pos=${ascii%%${i:$j:1}*}
eval char=\$\'\\$( printf "%o" "$(( ${#pos} ))" )\'
[ "${eng/$char/}" == "$eng" ] && continue
else
char="${i:$j:1}"
fi

pos="${eng%%$char*}"

sleep 1

printf "%s " "${code[${#pos}]}"

done
printf " "
done
printf "\n"
fi
done
