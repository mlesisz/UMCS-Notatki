#!/bin/bash

zenity_present=`command -v zenity|wc -l`
kdialog_present=`command -v kdialog|wc -l`
gdialog_present=`command -v gdialog|wc -l`
xterm_present=`command -v xterm|wc -l`

wine_present=`command -v wine|wc -l`

if [ $wine_present -gt 0 ];
then
	result=`wine asemw.exe *.asm`
else
	result="There is no Wine installed"
fi


if [ $zenity_present -gt 0 ];
then
	zenity --info --text="$result"
elif [ $kdialog_present -gt 0 ];
then
	kdialog --msgbox "$result"
elif [ $gdialog_present -gt 0 ];
then
	gdialog --msgbox "$result"
elif [ $xterm_present -gt 0 ]
then
	xterm -hold -e echo "$result"
fi

exit
