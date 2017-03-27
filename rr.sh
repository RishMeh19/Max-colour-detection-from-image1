
for file in /home/rishabh/Documents/CODES/test/* #replace this with path of the directory in which images are saved
do
  convert -resize 100x100\! "$file" -depth 1 -format %c histogram:info:- > results1.out
c=0
while read line
do
fu[$c]=$line 
my[$c]=$( echo "$line" |cut -d\: -f1 ) #$line
c=$(expr $c + 1)
done >> results1.out
#echo ${my[0]}
#echo ${my[1]}
#echo "$((${my[0]} + ${my[1]}))"
m1=0
m2=0
for n in "${my[@]}" ; do
((n>m1)) && ((m1=$n))
done  #/home/rishabh/Documents/CODES/results1.out
#echo "$m1"
for j in "${my[@]}" ; do
((j>m2 && j!=m1 )) && ((m2=$j))
done 
echo "$m2"
for ((i=0 ; i <${#my[@]} ; ++i)) ; do
if [ "$m2" = "${my[$i]}" ]; then 
echo "${fu[i]##* }" >> final.out
fi
done
unset my
unset fu
done


