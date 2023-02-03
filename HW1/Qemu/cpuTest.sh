#! /bin/bash
#

primes='20000 50000 90000'
no=5
File=cpuTest_QEMU_op.txt

echo System Virtualization CPU Test > $File
for prime in $primes; do
for (( i=1; i <=$no; i++ ))
do
	echo Test $i for max_prime $prime >> $File
	sysbench --test=cpu --cpu-max-prime=$prime run >> $File
	echo Test $i done >> $File
done	
done
