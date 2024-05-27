#!/bin/bash
testcase_dir=$2
test_name=$1

func_testcase_dir=$(realpath $(dirname "$0")/./${testcase_dir})

test_single() {
	test_file=`realpath --relative-base=$func_testcase_dir $func_testcase_dir/$1.tea`	
	test_name=${test_file%.tea}
	
	echo -n $test_name
	echo ": "

	./compiler $func_testcase_dir/$test_name.tea
	if [ $? != 0 ]; then
		echo fail compiler; exit -1
	fi


	aarch64-linux-gnu-gcc -c $func_testcase_dir/$test_name.S -o output/$test_name.o
    aarch64-linux-gnu-gcc output/$test_name.o sylib/sylib.o -o output/$test_name
	if [ $? != 0 ]; then
		echo "fail to compile"; exit -1
	fi
	ARCH=$(uname -m)
	if [ -f $func_testcase_dir/$test_name.in ]; then
		qemu-aarch64 ./output/$test_name < $func_testcase_dir/$test_name.in > output/$test_name.out
	else
		qemu-aarch64 ./output/$test_name > output/$test_name.out
	fi
	echo -e $? >> ./output/$test_name.out
	diff -Bb ./output/$test_name.out $func_testcase_dir/$test_name.out > /dev/null 2>/dev/null
	if [ $? == 0 ]; then
        echo pass; 
	else
		echo fail;\
		echo "Expect:";\
		cat $func_testcase_dir/$test_name.out;\
		echo "Got:";\
		cat ./output/$test_name.out;\
		exit -1
	fi
}

main() {
	test_single $1
}

main $@
