#!/bin/bash

for splits in `seq 1 4`
do

IMPAR=($(sed -n 'n;p' canal_html.txt))
PAR=($(sed -n 'p;n' canal_html.txt))
NUMERO_LINEAS=$(wc -l canal_html.txt | cut -d ' ' -f 1)
DIV=$(expr $NUMERO_LINEAS / 2 - 1)


		if [ $splits == 1 ]
		then
			echo "<tr>" >> index.html
			echo $LINEA | awk -v array=$splits '{split($0,a,";"); print "<td>"a[array]"</td>""\n"}'\
			       	>> index.html
		elif [ $splits == 4 ]
		then
			echo $LINEA | awk -v array=$splits '{split($0,a,";"); print "<td>"a[array]"</td>""\n"}'\
			       	>> index.html
			for ((i = 0 ; i <= ${DIV} ; i++ )) 
			do
				if [[ $i == 0 ]]
				then
					echo "<td><a href=${IMPAR[$i]}>${PAR[$i]}</a><br>" >> index.html
				elif [[ $i == $DIV ]]
				then
				     	echo "<a href=${IMPAR[$i]}>${PAR[$i]}</a></td>" >> index.html
				else
					echo "<a href=${IMPAR[$i]}>${PAR[$i]}</a><br>" >> index.html

			     	fi	     
			done

			echo "</tr>" >> index.html
		else
        		echo $LINEA | awk -v array=$splits '{split($0,a,";"); print "<td>"a[array]"</td>""\n"}'\
			       	>> index.html
		
        	fi

done
