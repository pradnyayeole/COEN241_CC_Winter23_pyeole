#! /bin/bash
#

primes='20000 50000 90000'
no=5
File=cpuTest_docker_output.txt

echo CPU TEST DOCKER > $File

for prime in $primes;  do

for(( i = 1; i <= no; i++ ))
do
	echo Test $i started for prime no. $prime >> $File
	docker run  csminpp/ubuntu-sysbench sysbench --test=cpu --cpu-max-prime=$prime run >> $File
	echo Test $i done >> $File
done
done

