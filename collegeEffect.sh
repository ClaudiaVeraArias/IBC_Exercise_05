collegegrad=$(cat wages.csv | grep -e '[0-9],16,' | cut -d , -f 4)
HSsum=$(cat wages.csv | grep -e '[0-9],12,' | cut -d , -f 4 | awk '{total += $0} END {print total}')
HSnum=$(cat wages.csv | grep -e '[0-9],12,' | wc -l)
echo "$HSsum / $HSnum" | bc
	 
