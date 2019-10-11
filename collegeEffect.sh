# Calculate the average wages of those with 12 years 
# of education experience, i.e. HS degree earner.

HSsum=$(cat wages.csv | grep -e '[0-9],12,' | cut -d , -f 4 | awk '{total += $0} END {print total}')
HSnum=$(cat wages.csv | grep -e '[0-9],12,' | wc -l)
x=$(echo "$HSsum / $HSnum" | bc)
 
# Calculate the average wage of those with 16 years 
# of education experience, i.e. college degree earner.
	 
collegesum=$(cat wages.csv | grep -e '[0-9],16,' | cut -d , -f 4 | awk '{total += $0} END {print total}')
collegenum=$(cat wages.csv | grep -e '[0-9],16,' | wc -l)
y=$(echo "$collegesum / $collegenum" | bc)

# Calculate the difference in average wages between 
# a HS degree earner and a college degree earner.

final=$((y-x))

# Report the calculations

echo "Wage earnings of the average HS graduate: $x dollars"
echo "Wage earnings of the average college graduate : $y dollars"
echo "A college graduate earns on average $final dollars more than those that merely completed High School."

