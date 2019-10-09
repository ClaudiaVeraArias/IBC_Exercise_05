collegegrad=$(cat wages.csv | grep -e '[0-9],16,' | cut -d , -f 4)
HSgrad=$(cat wages.csv | grep -e '[0-9],12,' | cut -d , -f 4 | awk '{total += $0} END {print total}')
echo $HSgrad	 
