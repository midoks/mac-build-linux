#!/bin/sh

export LC_ALL=C

bash --version | head -n1 | cut -d " " -f2-4

# MYSH=$(readlink -f /bin/bash)
#echo "/bin/sh -> $MYSH" 

MYSH=/bin/bash

echo  "Binutils: "; ld -v | head -n1 | cut -d " " -f3-
bison --version | head -n1

if [ -h /usr/bin/yacc ];then
	echo "/usr/bin/yacc -> "
elif [ -x /usr/bin/yacc ]; then
	echo "yacc is `/usr/bin/yacc --version | head -n1`"
else
	echo "yacc not found"
fi

bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d " " -f1,6-
# echo "coreutils: "; chown --version |head -n1 | cut -d " " -f2

diff -v | head -n1
# find -v | head -n1

gcc -v 2>&1 < /dev/null | head -n1

echo "int main(){}" > dummy.cpp && g++ -o dummy dummy.cpp
if [ -x dummy ];then
	echo "g++ compilation ok"
else
	echo "g++ compilation failed"
fi

rm -rf dummy dummy.cpp