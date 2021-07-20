#!/bin/bash
  
awk '!seen[$0]++' names > removed_duplicates && awk '{print tolower($0)}' removed_duplicates > removed_cl && awk '!seen[$0]++' removed_cl > final_names
rm removed_duplicates removed_cl
input="final_names"
while IFS= read -r line
do
  mkdir $(echo $line | tr ' ' '_');
done < "$input"
