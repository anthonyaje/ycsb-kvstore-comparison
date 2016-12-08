# Memcached, Redis, and Aerospike Key-Value Store Empirical Comparison

1. The code in this repository are based on [Yahoo! Cloud System Benchmark (YCSB)](https://github.com/brianfrankcooper/YCSB) repository. 
2. Modified code in _redis_ and _redis-binding_ folder.
3. Automated scripts are added for benchmarking the three databases. 
## Setting up the databases

### Installing Memcached  
Installing via apt-get  
`apt-get -y update`  
`apt-get -y install memcached`

Changing the configuration  
`vim /etc/memcached.conf`  

Running/Stopping Memcached server  
`service memcached start`  
`service memcached stop`  

### Installing Redis  
Installing via tarball
`wget http://download.redis.io/redis-3.2.5.tar.gz`  
`tar xvzf redis-3.2.5.tar.gz`  
`cd redis-3.2.5`  
`make`  
`make install`  

Changing configuration file  
`vim redis-3.2.5/redis.conf`  

Running/Stopping Redis server
`redis-server redis-3.2.5/redis.conf`  
