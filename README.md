# Memcached, Redis, and Aerospike Key-Value Store Empirical Comparison
This project empirically evaluates Memcached, Redis and Aerospike key-value store leveraging Yahoo! Cloud System Benchmark (YCSB) with various workloads and benchmarking settings aiming to provide useful insight for each kv-store.  
## Note
1. The code in this repository are based on [YCSB](https://github.com/brianfrankcooper/YCSB) repository.  
2. Modified code in [_redis_](https://github.com/anthonyaje/ycsb-kvstore-comparison/tree/master/redis) and [_redis-binding_](https://github.com/anthonyaje/ycsb-kvstore-comparison/tree/master/redis-binding) directory.  
3. Automated scripts are added for benchmarking the three databases.   
4. Configuration files for running YCSB in our benchmarking is available in [_benchmark_](https://github.com/anthonyaje/ycsb-kvstore-comparison/tree/master/benchmark) directory.
5. Sample configuration files for running YCSB in our benchmarking is available in [_benchmark/db_configs_](https://github.com/anthonyaje/ycsb-kvstore-comparison/tree/master/benchmark/db_configs) directory.


## Setting up the databases on Ubuntu 12.04

### Installing Memcached  
Installing via apt-get  
`apt-get -y update`  
`apt-get -y install memcached`

Changing the configuration  
`vim /etc/memcached.conf`  

Running Memcached server  
`service memcached start`  

### Installing Redis  
Installing via tarball
`wget http://download.redis.io/redis-3.2.5.tar.gz`  
`tar xvzf redis-3.2.5.tar.gz`  
`cd redis-3.2.5`  
`make`  
`make install`  

Changing configuration file  
`vim redis-3.2.5/redis.conf`  

Running Redis server  
`redis-server redis-3.2.5/redis.conf`  

### Installing Aerospike  
Instsalling Aerospike server  
`wget -O aerospike.tgz 'http://aerospike.com/download/server/latest/artifact/ubuntu12'`  
`tar -xvf aerospike.tgz`  
`cd aerospike-server-community-*-ubuntu12`  
`sudo ./asinstall `  

Changing configuration file  
`vim /etc/aerospike/aerospike.conf`  

Runing Aerospike server  
`sudo service aerospike start && \
  sudo tail -f /var/log/aerospike/aerospike.log | grep cake
  # wait for it. "service ready: soon there will be cake!"`  
  
## Running the benchmarking  

### Database server side machine(s)  
Start the databases server(s) as instructed above.  

### Client side machine  
Install the modified YCSB project  
`git clone https://github.com/anthonyaje/ycsb-kvstore-comparison.git`  

Execute the YCSB _load phase_   
`./load_benchmark.sh [redis|riak|memcached] [single|cluster] [balanced|write_heavy|read_heavy]`  

Execute the YCSB _run phase_   
`./run_benchmark.sh [redis|riak|memcached] [single|cluster] [balanced|write_heavy|read_heavy]`  
This script will execute 4 iterations of YCSB _run phase_ for each number of threads 1 4 8 12 16 20 24 28 32.  
The results will be generated in `results/$1/$2/$3/out_run_$t-$k` where   
`$1 $2 $3` are the parameters passed when executing the scripts  
`$t` and `$k` are #thread and #iteration.   

## Post benchmarking
### Preprocessing the results
Remove the result for the 1st run (the result for the first cold start)  
`cd` to the results directory  
`rm out_run_*-1`  

### Processing the bencmarking results
Calculate the average throughput and latencies  
`cd` to the results directory  
`cp ~/ycsb-kvstore-comparison/calc_* ./`  
`./calc_tp_avg.sh`
`./calc_lat_read_avg.sh`  
`./calc_lat_read_avg.sh`  
This scripts generate `tp_avg`, `lat_read_avg`, and `lat_write_avg` that contain the average throughput, read latency, and write latency for each #thread respectively.  

## Contributors
[Anthony](mailto:a3anthon@uwterloo.ca)  
[Yaganti Naga Malleswara Rao](mailto:nmyagant@uwterloo.ca)

