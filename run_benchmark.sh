#!/bin/bash

# usage run_benchmark.sh [redis|riak|memcached] [balanced|write_heavy|read_heavy]
if [ "$#" -eq 3 ]; then
	for t in 1 4 8 12 16 20 24 28 32
	do
		echo -e "##########################    #thread: $t   #########################################"
		for k in 1 2 3 4
		do 
		    ./bin/ycsb run $1 -s -P ./benchmark/$3 -P ./benchmark/$2_setting -p "threadcount=$t" > "results/$1/$2/$3/out_run_$t-$k"
		    echo -e "###################  done: results/$1/$2/$3/out_run_$t-$k ###############"
		done
	done 
else 
	echo " usage run_benchmark.sh [redis|riak|memcached] [single|cluster] [balanced|write_heavy|read_heavy]"
fi

