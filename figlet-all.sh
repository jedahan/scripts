#!env bash

for i in `ls /usr/share/figlet/*flf | cut -d'/' -f5 | cut -d'.' -f1`
do
    figlet -f $i $@
done
