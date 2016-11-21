#!/bin/zsh



grep "\-cyclus" ABI_full.txt > ABI_minus.txt
grep "\+cyclus" ABI_full.txt > ABI_plus.txt

minus_file="ABI_minus.txt"
plus_file="ABI_plus.txt"

while read -r line
do
      
      #echo ${line:1} |cut -d'(' -f1 | sed -e 's/std::string/std::__cxx11::basic_string\<char, std::char_traits\<char\>, std::allocator\<char\> \>/g'
      tofind=`echo ${line:1} |cut -d'(' -f1`
      #echo $tofind 
      echo $line
      grep $tofind $plus_file
      echo " "
done < "$minus_file"
