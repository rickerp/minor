#!/bin/bash
# README:
# This will detect if `brg` selection was successful for each test.

testDir="$(dirname "$0")"
cd "$testDir"

total=0
passed=0

for f in $(find tests_p1/pass -name "*.min" | sort); do
    ((total++))    
    ../src/minor -trace < $f 2>&1 | grep "selection successful"
    if [ $? -ne 0 ]; then
        echo "> failed $f"
    else
        echo "passed $f"
        ((passed++))
    fi
done

cd -

echo $passed/$total
exit $((($total-$passed)?1:0))
