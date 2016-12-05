#!/bin/bash

# usage load_benchmark.sh [redis|riak|memcached] [single|cluster] [balanced|write_heavy|read_heavy]
t=12;
k=1;
if [ "$#" -eq 3 ]; then 
	./bin/ycsb load $1 -s -P ./benchmark/$3 -P ./benchmark/$2_setting -p "threadcount=$t" > ./results/$1/$2/$3/out_load_$t-$k
	echo "done: results/$1/$2/$3/out_load_$t-$k"
else
	echo " usage load_benchmark.sh [redis|riak|memcached] [single|cluster] [balanced|write_heavy|read_heavy]"
fi

