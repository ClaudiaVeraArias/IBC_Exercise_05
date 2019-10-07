#1)
#unique G-YE
#cut gener and YearExp
#sort by gener and then yearsExp 

cat wages.csv | cut -d , -f 1,2 >> ExGib.csv
cat ExGib.csv |  sed 's/,/ /g' >> ExGib2.txt
egrep -w 'male' ExGib2.txt | sort -u -n -k 2 >> ExGib3.txt 
egrep -w 'female' ExGib2.txt | sort -u -n -k 2 >> ExGib3.txt

