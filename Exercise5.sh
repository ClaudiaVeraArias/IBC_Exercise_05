echo Part 1

# Write unique gender-yearsExperience combinations in ExGib3.txt
cat wages.csv | cut -d , -f 1,2 >> ExGib.csv
cat ExGib.csv |  sed 's/,/ /g' >> ExGib2.txt
egrep -w 'male' ExGib2.txt | sort -u -n -k 2 >> ExGib3.txt 
egrep -w 'female' ExGib2.txt | sort -u -n -k 2 >> ExGib3.txt
cat ExGib3.txt

echo Part 2
# Report to standard out Highest and Lowest wager earners and the number of 
# female wage earners in the top ten. 

highwage=$(cat wages.csv | sort -n -t , -k 4 | tail -n 1 | cut -d , -f 1,2,4)
lowwage=$(cat wages.csv | sort -n -t , -k 4 | head -n 2 | grep male | cut -d , -f 1,2,4)
echo "Highest wage earner: $highwage"
echo "Lowest wage earner: $lowwage"
TopFem=$(cat wages.csv | sort -n -t , -k 4 | tail -n 10 | grep 'female' | wc -l)
echo "The number of women in the top ten wage earners is $TopFem."

echo Part 3

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
