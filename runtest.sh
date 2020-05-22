#!/bin/bash

for p in *.min; do
	f=$(basename $p .min)
	echo ""
	echo -e "\e[1m \e[96mRunning minor for" $f "\e[0m"
	./minor -trace $p
	echo ""
	echo -e "\e[1m \e[96mRunning nasm for" $f "\e[0m"
	nasm -felf32 $f.asm -o $f.o
done
echo ""
echo -e "\e[1m \e[96mRunning ld \e[0m"
ld -m elf_i386 *.o libminor.a -o test.run
echo ""
echo -e "\e[1m \e[96mRunning...\e[0m"
./test.run