#! /bin/bash
#

no=5
File=fileioTest_docker_op.txt

echo Fileio test-docker > $File

echo $filecommand

for(( i = 1; i <= no; i++ ))
do
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=rndwr prepare
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=rndwr run >> $File
	docker run csminpp/ubuntu-sysbench sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=rndwr cleanup
	echo Test $i done >> $File
	echo Clearing cache >> $File
sync && sudo purge
done
