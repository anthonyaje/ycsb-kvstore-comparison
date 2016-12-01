#!/bin/bash

# usage run_benchmark.sh [redis|riak|memcached]
for t in 12 
do
        echo -e "##########################    #thread: $t   #########################################"
	for k in 1 2
	do 
	    ./bin/ycsb run $1 -s -P ~/benchmark/single_node_mix -P ~/benchmark/single_node_setting -p "threadcount=$t" > "results/$1/single_node/out_2cli2_run_$t-$k"
	    echo -e "###################  done: results/$1/single_node/out_run_$t-$k ###############"
	done
done 

