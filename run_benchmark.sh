#!/bin/bash

# usage run_benchmark.sh [redis|riak|memcached]
if [ "$#" -eq 2 ]; then
	for t in 1 5 10 15 20 25 30 
	do
		echo -e "##########################    #thread: $t   #########################################"
		for k in 1 2 3 4
		do 
		    ./bin/ycsb run $1 -s -P ./benchmark/$2_5050 -P ./benchmark/$2_setting -p "threadcount=$t" > "results/$1/$2/out_run_$t-$k"
		    echo -e "###################  done: results/$1/$2/out_run_$t-$k ###############"
		done
	done 
else 
	echo " usage run_benchmark.sh [redis|riak|memcached] [single|cluster]"
fi

