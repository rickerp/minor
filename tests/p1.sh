#!/bin/bash
testDir="$(dirname "$0")"		# Test directory
srcDir=..	    			# Compiler make-file directory
exe="minor"

# Go to source directory and make compiler
cd "$srcDir"
srcDir=$(pwd)
{
make clean
make
}  2>&1 | grep "conflict"

# Check conflicts
if [ $? -eq 0 ]; then
	echo "byacc has conflicts, please fix them"
else
	echo "no byacc conflicts, well done"
fi

# Check the compiler itself
if [ ! -f $exe ]; then
    echo "$exe was not found - aborting"
	exit
fi

# Go back to test dir
cd - > /dev/null
cd $testDir

total=0
pass=0

passed="\e[32mPASSED\e[0m"
failed="\e[31mFAILED\e[0m"

# These tests should pass
echo " ===== PASS TESTS ===== [should compile]"
for f in $(find tests_p1/pass -name "*.min"); do
	output=$("$srcDir/$exe" -trace < $f 2>&1)# &> /dev/null
	if [ $? -ne 0 ]; then
		echo -e $failed $f
	else
        echo "$output" | grep "selection successful" 
        if [ $? -ne 0 ]; then
            echo "burg selection was not successful"
		    echo -e $failed $f
        else
            ((pass++))
            echo -e $passed $f
        fi
	fi
    ((total++))
done

# These tests should fail
echo " ===== FAIL TESTS ===== [should not compile]"
for f in $(find tests_p1/fail -name "*.min"); do
	"$srcDir/$exe" < $f &>/dev/null
	if [ $? -ne 0 ]; then
        ((pass++))
		echo -e $passed $f
	else
		echo -e $failed $f
	fi
    ((total++))
done

echo " ===== STATUS ===== "
echo passed $pass/$total

# Clean source directory
cd "$srcDir"
# make clean > /dev/null

exit $((($total-$pass)?1:0))
