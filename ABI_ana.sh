#!/bin/zsh

minus_file="$1"
plus_file="$2"

while read -r line
do
      
      #echo ${line:1} |cut -d'(' -f1 | sed -e 's/std::string/std::__cxx11::basic_string\<char, std::char_traits\<char\>, std::allocator\<char\> \>/g'
      tofind=`echo ${line:1} |cut -d'(' -f1 | sed -e 's/std::string/std::__cxx11::basic_string\<char, std::char_traits\<char\>, std::allocator\<char\> \>/g' | sed -e 's/std::list/std::__cxx11::list/g' | sed -e 's/>>/> >/g'`
      #echo $tofind 
      echo $line
      grep $tofind $plus_file
      echo " "
done < "$minus_file"
