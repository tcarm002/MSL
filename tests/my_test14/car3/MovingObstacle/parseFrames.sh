#!/bin/bash           

file=frames

while read line; do
	var=$line
done < $file

#set -- $var
#paramCount=$1 #Configuration parameter count
#numParams=paramCount/2 #hard-coded; The actual number of params for 1 robot

paramCt=6
x=0
for i in $var;do
	if  [ $x -eq 0 ] || [ $x -eq 1 ] || [ $x -eq 2 ] || [ $x -eq 6 ]
	then
		if  [ $x -eq 0 ] 
		then 
			line+=3
		else
			line+=$i
		fi
		line+=' '
		if [ $x -eq $paramCt ] ; then
			x=-1
			echo $line
			echo $line >> frames_output
			line=''
		fi
	fi
((x++))
done
