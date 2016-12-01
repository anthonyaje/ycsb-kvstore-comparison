#!/bin/bash

# usage load_benchmark.sh [redis|riak|memcached] [single|cluster]
t=12;
k=1;
if [ "$#" -eq 2 ]; then 
	./bin/ycsb load $1 -s -P ./benchmark/$2_5050 -P ./benchmark/$2_setting -p "threadcount=$t" > ./results/$1/$2/out_load_$t-$k
	echo "done: results/$1/$2/out_load_$t-$k"
else
	echo " usage load_benchmark.sh [redis|riak|memcached] [single|cluster]"
fi

