#!/bin/bash

# Convert the input names to final names removing duplications and capital letters
awk '!seen[$0]++' names > removed_duplicates && awk '{print tolower($0)}' removed_duplicates > removed_cl && awk '!seen[$0]++' removed_cl > final_names
# Remove not needed files
rm removed_duplicates removed_cl
# For each line in final names file create a directory. For names with whitespace swap it with underscore
input="final_names"
while IFS= read -r line
do
  mkdir $(echo $line | tr ' ' '_');
done < "$input"
