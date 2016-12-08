# Memcached, Redis, and Aerospike Key-Value Store Empirical Comparison

1. The code in this repository are based on [Yahoo! Cloud System Benchmark (YCSB)](https://github.com/brianfrankcooper/YCSB) repository. 
2. Modified code in _redis_ and _redis-binding_ folder.
3. Automated scripts are added for benchmarking the three databases. 
## Setting up the databases on Ubuntu 12.04

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

### Installing Aerospike  
Instsalling Aerospike server  
`wget -O aerospike.tgz 'http://aerospike.com/download/server/latest/artifact/ubuntu12'`  
`tar -xvf aerospike.tgz`  
`cd aerospike-server-community-*-ubuntu12`  
`sudo ./asinstall `  

Changing configuration file  
`vim /etc/aerospike/aerospike.conf`  
`sudo service aerospike start && \
  sudo tail -f /var/log/aerospike/aerospike.log | grep cake
  # wait for it. "service ready: soon there will be cake!"`  
  
## Running the benchmarking  
### Client side machine
Install the modified YCSB project  
`git clone https://github.com/anthonyaje/ycsb.git`  
