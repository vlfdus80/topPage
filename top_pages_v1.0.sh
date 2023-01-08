#!/bin/bash
export LC_ALL=C;

pattern='"[^"]+"';

declare -i total;
total=$( wc -l $1 | cut -d ' ' -f 1);

echo -e "\n";
echo -e "Total Line Count : ${total}\n";

echo "******************Group by Method*****************"
declare -i postVal getVal optionVal headVal etcVa methodTotalVall getpostVal;

getVal=$(grep -a  'GET ' $1 | wc -l | cut -d ' ' -f 1);
postVal=$(grep -a 'POST ' $1 | wc -l | cut -d ' ' -f 1);
optionVal=$(grep -a 'OPTIONS ' $1 | wc -l | cut -d ' ' -f 1);
headVal=$(grep -a 'HEAD ' $1 | wc -l | cut -d ' ' -f 1);
etcVal=$(grep -va 'GET ' $1 | grep -va 'POST ' | grep -va 'OPTIONS '| grep -va 'HEAD ' | wc -l | cut -d ' ' -f 1);
methodTotalVal=$(( getVal + postVal + optionVal + headVal + etcVal ));
getpostVal=$(( getVal + postVal ));

echo -e "GET Methon Count : ${getVal}\n";
echo -e "POST Method Count : ${postVal}\n";
echo -e "OPTION Method Count : ${optionVal}\n";
echo -e "HEAD Method Count : ${headVal}\n";
echo -e "ETC Count : ${etcVal}\n";
echo -e "Method Total Count : ${methodTotalVal}\n";
echo -e "GET AND POST Method to Test Count : ${getpostVal}\n";

grep -ae 'GET' -ae 'POST' $1 > tmp_getpost.txt;

if (( total==methodTotalVal ));then echo "OK"; else echo "Not Mached"; fi

echo "**********Group by Dynamic & Statuc***************";
declare -i dynamicVal staticVal allticVal;

staticVal=$(cat tmp_getpost.txt | grep -ae '\.png' -ae '\.js[^a-z]' -ae '\.jpg' -ae '\.css' | wc -l | cut -d ' ' -f 1);
dynamicVal=$(cat tmp_getpost.txt | grep -va '\.png' | grep -va '\.js[^a-z]' | grep -va '\.jpg' | grep -va '\.css' | wc -l | cut -d ' ' -f 1);
allticVal=$(( dynamicVal + staticVal ));
echo -e "Static pages in GETPOST Count : ${staticVal}\n";
echo -e "Dynamic pages in GETPOST Count : ${dynamicVal}\n";

cat tmp_getpost.txt | grep -va '\.png' | grep -va '\.js[^a-z]' | grep -va '\.jpg' | grep -va '\.css'  >  tmp_getpost_dynamic.txt;

if (( $getpostVal == $allticVal ));then echo "OK"; else echo "Not Mached"; fi

echo "*********transaction count per hour***************";
declare -i sumVal;

echo "Dynamic pages in GET AND POST";
echo -e "          ***  Top $2 pages  ***";

cat tmp_getpost_dynamic.txt | awk -v pattern=$pattern 'BEGIN{} { match($0,pattern) } {timeVal[substr($0,RSTART+1,RLENGTH-2)]++;} END {for (key in timeVal) printf("%s : %d\n", key, timeVal[key]);}' | sort -t " " -k5 -n -r > tmp_TOP.txt


head -n $2 tmp_TOP.txt; 

sumVal=$(awk 'BEGIN{FS=" ";}{ sum += $5 } END { print sum }' tmp_TOP.txt);
echo -e "SUM : $sumVal\n";

if (( dynamicVal==sumVal ));then echo "OK"; else echo "Not Mached"; fi

#rm tmp_getpost.txt tmp_getpost_dynamic.txt tmp_TPH.txt;

