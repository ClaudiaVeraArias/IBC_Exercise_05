highwage=$(cat wages.csv | sort -n -t , -k 4 | tail -n 1 | cut -d , -f 1,2,4)
lowwage=$(cat wages.csv | sort -n -t , -k 4 | head -n 2 | grep male | cut -d , -f 1,2,4)
echo "Highest wage earner: $highwage"
echo "Lowest wage earner: $lowwage"
TopFem=$(cat wages.csv | sort -n -t , -k 4 | tail -n 10 | grep 'female' | wc -l)
echo "The number of women in the top ten wage earners is $TopFem"
