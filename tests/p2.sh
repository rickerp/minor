#!/bin/bash
root=tests_p2

# Test part 1
output=$(./p1.sh)
if [[ $? -ne 0 ]]; then
    echo "some part 1 tests not passing"
    echo "$output" #| grep FAILED
    #exit 1
else
    echo "part 1 tests passing"
fi

count=$(find "$root" | grep "\.min" | wc -l)
echo "$count test files were detected"

# Compile
cd ..
srcDir=$(pwd)
{ make clean; make; } > /dev/null 
if [[ $? -ne 0 ]]; then
    echo "make failed!"
    exit 1
fi
cd - > /dev/null

function testDir {
    echo -e "\e[33m$(basename $1)\e[0m"
    local save=$(pwd)
    cd $1
    if ls *.min &> /dev/null; then
        
        rm -f *.o *.asm
        for p in *.min; do
            $srcDir/minor < $p &> /dev/null 
            base=$(basename $p .min)
            mv out.asm $base.asm
            nasm -felf32 $base.asm -o $base.o
        done
        ld -m elf_i386 *.o $srcDir/libminor.a -o a.out
    
        # Look into test folders
        for d in $(ls -d t*/); do
            cd $d

            # Run test
            args=""
            if [[ -f "args" ]]; then
                args=$(cat args)
            fi

            # Create empty input if not present
            if [[ ! -f "in" ]]; then
                touch "in"
            fi

            ../a.out $args < "in" > "myout"
            echo $? > "myret"

            # Check output
            diff "myout" "out" > "diff"
            equal=$?
            
            # Assume ret code of 0
            if [[ ! -f "ret" ]]; then
                echo 0 > "ret"
            fi

            diff "myret" "ret" -q &>/dev/null
            equalRet=$?
            
            if [[ $equal -eq 0 ]] && [[ $equalRet -eq 0 ]]; then
                echo -e "\e[36m$d\e[0m - \e[32mPASSED\e[0m"
                ((pass++))
            else
                echo -e "\e[36m$d\e[0m - \e[31mFAILED\e[0m"
                if [[ $equal -ne 0 ]]; then
                    echo -e "out files differ"
                fi
                if [[ $equalRet -ne 0 ]]; then
                    echo -e "ret code differs: expected $(cat "ret") but got $(cat "myret")"
                fi
            fi
            ((total++))
            cd - > /dev/null
        done

    fi
    cd $save
}

pass=0
total=0
cd $root

for l in $(ls -d */ 2>/dev/null); do
    testDir "$l"
done

echo "passed $pass/$total"
