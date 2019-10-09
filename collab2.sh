highwage=$(cat wages.csv | sort -n -t , -k 4 | tail -n 1 | cut -d , -f 1,2,4)
lowwage=$(cat wages.csv | sort -n -t , -k 4 | head -n 2 | grep male | cut -d , -f 1,2,4)
echo $highwage
echo $lowwage

