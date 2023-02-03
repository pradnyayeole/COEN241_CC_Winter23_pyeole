#! /bin/bash
#

modes='rndwr seqrd seqrewr'
no=5
File=fileioTest_QEMU_op.txt

echo System Virtualization FileIO Test > $File
for mode in $modes; do
for (( i=1; i <=$no; i++ ))
do
	echo Test $i for mode $mode >> $File
	sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode prepare
	sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode run >> $File
	sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=$mode cleanup
	echo Test $i done >> $File
	echo3 > /proc/sys/vm/dropcaches
done	
done
