echo 1

cat wages.csv | cut -d , -f 1,2 >> ExGib.csv
cat ExGib.csv |  sed 's/,/ /g' >> ExGib2.txt
egrep -w 'male' ExGib2.txt | sort -u -n -k 2 >> ExGib3.txt 
egrep -w 'female' ExGib2.txt | sort -u -n -k 2 >> ExGib3.txt
cat ExGib3.txt

echo 2

highwage=$(cat wages.csv | sort -n -t , -k 4 | tail -n 1 | cut -d , -f 1,2,4)
lowwage=$(cat wages.csv | sort -n -t , -k 4 | head -n 2 | grep male | cut -d , -f 1,2,4)
echo "Highest wage earner: $highwage"
echo "Lowest wage earner: $lowwage"
TopFem=$(cat wages.csv | sort -n -t , -k 4 | tail -n 10 | grep 'female' | wc -l)
echo "The number of women in the top ten wage earners is $TopFem"

echo 3

collegegrad=$(cat wages.csv | grep -e '[0-9],16,' | cut -d , -f 4)

HSsum=$(cat wages.csv | grep -e '[0-9],12,' | cut -d , -f 4 | awk '{total += $0} END {print total}')
HSnum=$(cat wages.csv | grep -e '[0-9],12,' | wc -l)
echo "$HSsum / $HSnum" | bc 
	 
collegesum=$(cat wages.csv | grep -e '[0-9],16,' | cut -d , -f 4 | awk '{total += $0} END {print total}')
collegenum=$(cat wages.csv | grep -e '[0-9],16,' | wc -l)
echo "$collegesum / $collegenum" | bc

x=$(echo "$HSsum / $HSnum" | bc)
y=$(echo "$collegesum / $collegenum" | bc)
final=$((y-x))
echo $final
