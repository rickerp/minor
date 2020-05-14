#!/bin/bash
EXE=./minor
EXT=.min
MAX=55
DIR=err/

cnt=0
pos=0
n=1
while [ $n -le $MAX ]; do
	num=`printf "%2.2d" $n`
	$EXE < $DIR${num}ok$EXT >& /dev/null
	ok=$?
	ko=' '
	if [ $ok -eq 0 ] ; then
		other=`ls $DIR${num}*$EXT | grep -v ${num}ok$EXT`
		$EXE < $other >& /dev/null
		ko=$?
		if [ $ko -ne 0 ]; then cnt=`expr $cnt + 1`; fi
		pos=`expr $pos + 1`
	fi
	echo $num: $ok $ko
	n=`expr $n + 1`
done
echo "TOTAL = $cnt in $MAX ($pos OK)"
