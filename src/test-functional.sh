#!/bin/bash
func_testcase_dir=$(realpath $(dirname "$0")/./tests/public)
# func_testcase_dir=$(realpath $(dirname "$0")/./tests/private)
test_single() {
	test_file=`realpath --relative-base=$func_testcase_dir $func_testcase_dir/$1.tea`	
	test_name=${test_file%.tea}
	
	echo -n $test_name
	echo ": "

	./compiler $func_testcase_dir/$test_name.tea
	if [ $? != 0 ]; then
		echo fail; exit -1
	fi
    llvm-link-14 --opaque-pointers $func_testcase_dir/$test_name.ll sylib.ll -S -o ./output/$test_name.ll
	if [ $? != 0 ]; then
		echo "fail to link"; exit -1
	fi
	if [ -f $func_testcase_dir/$test_name.in ]; then
    	lli-14 --opaque-pointers ./output/$test_name.ll < $func_testcase_dir/$test_name.in > output/$test_name.out
	else
    	lli-14 --opaque-pointers ./output/$test_name.ll > ./output/$test_name.out
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
