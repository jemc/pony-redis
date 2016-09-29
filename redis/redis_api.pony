
trait tag RedisAPI
  fun tag _cmd[A: Any val, T: _TransformResult[A]](command: ReadSeq[String]): _Promise[A]
  
  fun tag append(key: String, value: String):
    _Promise[I64]
  => "Append a value to a key"
    _cmd[I64, _I64Result](["APPEND", key, value])
  
  fun tag auth(password: String):
    _Promise[None]
  => "Authenticate to the server"
    _cmd[None, _OkResult](["AUTH", password])
  
  fun tag bgrewriteaof():
    _Promise[None]
  => "Asynchronously rewrite the append-only file"
    _cmd[None, _OkResult](["BGREWRITEAOF"])
  
  fun tag bgsave():
    _Promise[None]
  => "Asynchronously save the dataset to disk"
    _cmd[None, _OkResult](["BGSAVE"])
  
  fun tag bitcount(key: String, start: I64 = 0, stop: I64 = -1):
    _Promise[I64]
  => "Count set bits in a string"
    _cmd[I64, _I64Result](["BITCOUNT", key, start.string(), stop.string()])
  
  // fun tag bitfield():
  //   _Promise[XXX]
  // => "Perform arbitrary bitfield integer operations on strings"
  //   _cmd[XXX, _XXXResult](["BITFIELD"])
  
  fun tag bitop(op: String, dest: String, sources: ReadSeq[String]):
    _Promise[I64]
  => "Perform bitwise operations between strings"
    _cmd[I64, _I64Result](["BITOP", op, dest].append(sources))
  
  fun tag bitpos(key: String, bit: Bool, start: I64 = 0, stop: (I64 | None) = None):
    _Promise[I64]
  => "Find first bit set or clear in a string"
    let cmd = ["BITPOS", key, if bit then "1" else "0" end, start.string()]
    try cmd.push((stop as I64).string()) end
    _cmd[I64, _I64Result](cmd)
  
  // fun tag blpop():
  //   _Promise[XXX]
  // => "Remove and get the first element in a list, or block until one is available"
  //   _cmd[XXX, _XXXResult](["BLPOP"])
  
  // fun tag brpop():
  //   _Promise[XXX]
  // => "Remove and get the last element in a list, or block until one is available"
  //   _cmd[XXX, _XXXResult](["BRPOP"])
  
  // fun tag brpoplpush():
  //   _Promise[XXX]
  // => "Pop a value from a list, push it to another list and return it; or block until one is available"
  //   _cmd[XXX, _XXXResult](["BRPOPLPUSH"])
  
  // fun tag client_kill():
  //   _Promise[XXX]
  // => "Kill the connection of a client"
  //   _cmd[XXX, _XXXResult](["CLIENT KILL"])
  
  // fun tag client_list():
  //   _Promise[XXX]
  // => "Get the list of client connections"
  //   _cmd[XXX, _XXXResult](["CLIENT LIST"])
  
  // fun tag client_getname():
  //   _Promise[XXX]
  // => "Get the current connection name"
  //   _cmd[XXX, _XXXResult](["CLIENT GETNAME"])
  
  // fun tag client_pause():
  //   _Promise[XXX]
  // => "Stop processing commands from clients for some time"
  //   _cmd[XXX, _XXXResult](["CLIENT PAUSE"])
  
  // fun tag client_reply():
  //   _Promise[XXX]
  // => "Instruct the server whether to reply to commands"
  //   _cmd[XXX, _XXXResult](["CLIENT REPLY"])
  
  // fun tag client_setname():
  //   _Promise[XXX]
  // => "Set the current connection name"
  //   _cmd[XXX, _XXXResult](["CLIENT SETNAME"])
  
  // fun tag cluster_addslots():
  //   _Promise[XXX]
  // => "Assign new hash slots to receiving node"
  //   _cmd[XXX, _XXXResult](["CLUSTER ADDSLOTS"])
  
  // fun tag cluster_count_failure_reports():
  //   _Promise[XXX]
  // => "Return the number of failure reports active for a given node"
  //   _cmd[XXX, _XXXResult](["CLUSTER COUNT-FAILURE-REPORTS"])
  
  // fun tag cluster_countkeysinslot():
  //   _Promise[XXX]
  // => "Return the number of local keys in the specified hash slot"
  //   _cmd[XXX, _XXXResult](["CLUSTER COUNTKEYSINSLOT"])
  
  // fun tag cluster_delslots():
  //   _Promise[XXX]
  // => "Set hash slots as unbound in receiving node"
  //   _cmd[XXX, _XXXResult](["CLUSTER DELSLOTS"])
  
  // fun tag cluster_failover():
  //   _Promise[XXX]
  // => "Forces a slave to perform a manual failover of its master."
  //   _cmd[XXX, _XXXResult](["CLUSTER FAILOVER"])
  
  // fun tag cluster_forget():
  //   _Promise[XXX]
  // => "Remove a node from the nodes table"
  //   _cmd[XXX, _XXXResult](["CLUSTER FORGET"])
  
  // fun tag cluster_getkeysinslot():
  //   _Promise[XXX]
  // => "Return local key names in the specified hash slot"
  //   _cmd[XXX, _XXXResult](["CLUSTER GETKEYSINSLOT"])
  
  // fun tag cluster_info():
  //   _Promise[XXX]
  // => "Provides info about Redis Cluster node state"
  //   _cmd[XXX, _XXXResult](["CLUSTER INFO"])
  
  // fun tag cluster_keyslot():
  //   _Promise[XXX]
  // => "Returns the hash slot of the specified key"
  //   _cmd[XXX, _XXXResult](["CLUSTER KEYSLOT"])
  
  // fun tag cluster_meet():
  //   _Promise[XXX]
  // => "Force a node cluster to handshake with another node"
  //   _cmd[XXX, _XXXResult](["CLUSTER MEET"])
  
  // fun tag cluster_nodes():
  //   _Promise[XXX]
  // => "Get Cluster config for the node"
  //   _cmd[XXX, _XXXResult](["CLUSTER NODES"])
  
  // fun tag cluster_replicate():
  //   _Promise[XXX]
  // => "Reconfigure a node as a slave of the specified master node"
  //   _cmd[XXX, _XXXResult](["CLUSTER REPLICATE"])
  
  // fun tag cluster_reset():
  //   _Promise[XXX]
  // => "Reset a Redis Cluster node"
  //   _cmd[XXX, _XXXResult](["CLUSTER RESET"])
  
  // fun tag cluster_saveconfig():
  //   _Promise[XXX]
  // => "Forces the node to save cluster state on disk"
  //   _cmd[XXX, _XXXResult](["CLUSTER SAVECONFIG"])
  
  // fun tag cluster_set_config_epoch():
  //   _Promise[XXX]
  // => "Set the configuration epoch in a new node"
  //   _cmd[XXX, _XXXResult](["CLUSTER SET-CONFIG-EPOCH"])
  
  // fun tag cluster_setslot():
  //   _Promise[XXX]
  // => "Bind a hash slot to a specific node"
  //   _cmd[XXX, _XXXResult](["CLUSTER SETSLOT"])
  
  // fun tag cluster_slaves():
  //   _Promise[XXX]
  // => "List slave nodes of the specified master node"
  //   _cmd[XXX, _XXXResult](["CLUSTER SLAVES"])
  
  // fun tag cluster_slots():
  //   _Promise[XXX]
  // => "Get array of Cluster slot to node mappings"
  //   _cmd[XXX, _XXXResult](["CLUSTER SLOTS"])
  
  // fun tag command():
  //   _Promise[XXX]
  // => "Get array of Redis command details"
  //   _cmd[XXX, _XXXResult](["COMMAND"])
  
  fun tag command_count():
    _Promise[I64]
  => "Get total number of Redis commands"
    _cmd[I64, _I64Result](["COMMAND COUNT"])
  
  // fun tag command_getkeys():
  //   _Promise[XXX]
  // => "Extract keys given a full Redis command"
  //   _cmd[XXX, _XXXResult](["COMMAND GETKEYS"])
  
  // fun tag command_info():
  //   _Promise[XXX]
  // => "Get array of specific Redis command details"
  //   _cmd[XXX, _XXXResult](["COMMAND INFO"])
  
  // fun tag config_get():
  //   _Promise[XXX]
  // => "Get the value of a configuration parameter"
  //   _cmd[XXX, _XXXResult](["CONFIG GET"])
  
  // fun tag config_rewrite():
  //   _Promise[XXX]
  // => "Rewrite the configuration file with the in memory configuration"
  //   _cmd[XXX, _XXXResult](["CONFIG REWRITE"])
  
  // fun tag config_set():
  //   _Promise[XXX]
  // => "Set a configuration parameter to the given value"
  //   _cmd[XXX, _XXXResult](["CONFIG SET"])
  
  // fun tag config_resetstat():
  //   _Promise[XXX]
  // => "Reset the stats returned by INFO"
  //   _cmd[XXX, _XXXResult](["CONFIG RESETSTAT"])
  
  fun tag dbsize():
    _Promise[I64]
  => "Return the number of keys in the selected database"
    _cmd[I64, _I64Result](["DBSIZE"])
  
  // fun tag debug_object():
  //   _Promise[XXX]
  // => "Get debugging information about a key"
  //   _cmd[XXX, _XXXResult](["DEBUG OBJECT"])
  
  // fun tag debug_segfault():
  //   _Promise[XXX]
  // => "Make the server crash"
  //   _cmd[XXX, _XXXResult](["DEBUG SEGFAULT"])
  
  fun tag decr(key: String):
    _Promise[I64]
  => "Decrement the integer value of a key by one"
    _cmd[I64, _I64Result](["DECR", key])
  
  fun tag decrby(key: String, decrement: I64):
    _Promise[I64]
  => "Decrement the integer value of a key by the given number"
    _cmd[I64, _I64Result](["DECRBY", key, decrement.string()])
  
  fun tag del(key: String):
    _Promise[Bool]
  => "Delete a key"
    _cmd[Bool, _BoolResult](["DEL", key])
  
  fun tag delm(keys: ReadSeq[String]):
    _Promise[I64]
  => "Delete some keys"
    _cmd[I64, _I64Result](["DEL"].append(keys))
  
  fun tag discard():
    _Promise[None]
  => "Discard all commands issued after MULTI"
    _cmd[None, _OkResult](["DISCARD"])
  
  fun tag dump(key: String):
    _Promise[String]
  => "Return a serialized version of the value stored at the specified key."
    _cmd[String, _BulkStringResult](["DUMP"])
  
  fun tag echo(m: String):
    _Promise[String]
  => "Echo the given string"
    _cmd[String, _BulkStringResult](["ECHO", m])
  
  // fun tag eval():
  //   _Promise[XXX]
  // => "Execute a Lua script server side"
  //   _cmd[XXX, _XXXResult](["EVAL"])
  
  // fun tag evalsha():
  //   _Promise[XXX]
  // => "Execute a Lua script server side"
  //   _cmd[XXX, _XXXResult](["EVALSHA"])
  
  // fun tag exec():
  //   _Promise[XXX]
  // => "Execute all commands issued after MULTI"
  //   _cmd[XXX, _XXXResult](["EXEC"])
  
  fun tag exists(key: String):
    _Promise[Bool]
  => "Determine if a key exists"
    _cmd[Bool, _BoolResult](["EXISTS", key])
  
  fun tag existsm(keys: ReadSeq[String]):
    _Promise[I64]
  => "Determine if some keys exist"
    _cmd[I64, _I64Result](["EXISTS"].append(keys))
  
  fun tag expire(key: String, seconds: I64):
    _Promise[Bool]
  => "Set a key's time to live in seconds"
    _cmd[Bool, _BoolResult](["EXPIRE", key, seconds.string()])
  
  fun tag expireat(key: String, timestamp: I64):
    _Promise[Bool]
  => "Set the expiration for a key as a UNIX timestamp"
    _cmd[Bool, _BoolResult](["EXPIREAT"])
  
  fun tag flushall():
    _Promise[None]
  => "Remove all keys from all databases"
    _cmd[None, _OkResult](["FLUSHALL"])
  
  fun tag flushdb():
    _Promise[None]
  => "Remove all keys from the current database"
    _cmd[None, _OkResult](["FLUSHDB"])
  
  fun tag geoadd(key: String, longitude: F64, latitude: F64, member: String):
    _Promise[Bool]
  => "Add a geospatial item in the geospatial index represented using a sorted set"
    _cmd[Bool, _BoolResult](["GEOADD", key, longitude.string(), latitude.string(), member])
  
  fun tag geoaddm(key: String, items: ReadSeq[(F64, F64, String)]):
    _Promise[I64]
  => "Add some geospatial items in the geospatial index represented using a sorted set"
    let cmd = ["GEOADD", key]
    for (longitude, latitude, member) in items.values() do
      cmd.push(longitude.string()).push(latitude.string()).push(member)
    end
    _cmd[I64, _I64Result](cmd)
  
  // fun tag geohash():
  //   _Promise[XXX]
  // => "Returns members of a geospatial index as standard geohash strings"
  //   _cmd[XXX, _XXXResult](["GEOHASH"])
  
  // fun tag geopos():
  //   _Promise[XXX]
  // => "Returns longitude and latitude of members of a geospatial index"
  //   _cmd[XXX, _XXXResult](["GEOPOS"])
  
  // fun tag geodist():
  //   _Promise[XXX]
  // => "Returns the distance between two members of a geospatial index"
  //   _cmd[XXX, _XXXResult](["GEODIST"])
  
  // fun tag georadius():
  //   _Promise[XXX]
  // => "Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a point"
  //   _cmd[XXX, _XXXResult](["GEORADIUS"])
  
  // fun tag georadiusbymember():
  //   _Promise[XXX]
  // => "Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a member"
  //   _cmd[XXX, _XXXResult](["GEORADIUSBYMEMBER"])
  
  fun tag get(key: String):
    _Promise[(String | None)]
  => "Get the value of a key"
    _cmd[(String | None), _BulkStringOrNoneResult](["GET", key])
  
  fun tag getbit(key: String, offset: I64):
    _Promise[Bool]
  => "Returns the bit value at offset in the string value stored at key"
    _cmd[Bool, _BoolResult](["GETBIT", key, offset.string()])
  
  fun tag getrange(key: String, start: I64, stop: I64):
    _Promise[String]
  => "Get a substring of the string stored at a key"
    _cmd[String, _BulkStringResult](["GETRANGE", key, start.string(), stop.string()])
  
  fun tag getset(key: String, value: String):
    _Promise[(String | None)]
  => "Set the string value of a key and return its old value"
    _cmd[(String | None), _BulkStringOrNoneResult](["GETSET"])
  
  fun tag hdel(key: String, field: String):
    _Promise[Bool]
  => "Delete a hash field"
    _cmd[Bool, _BoolResult](["HDEL", key, field])
  
  fun tag hdelm(key: String, fields: ReadSeq[String]):
    _Promise[I64]
  => "Delete one or more hash fields"
    _cmd[I64, _I64Result](["HDEL", key].append(fields))
  
  fun tag hexists(key: String, field: String):
    _Promise[Bool]
  => "Determine if a hash field exists"
    _cmd[Bool, _BoolResult](["HEXISTS", key, field])
  
  fun tag hget():
    _Promise[(String | None)]
  => "Get the value of a hash field"
    _cmd[(String | None), _BulkStringOrNoneResult](["HGET"])
  
  // fun tag hgetall():
  //   _Promise[XXX]
  // => "Get all the fields and values in a hash"
  //   _cmd[XXX, _XXXResult](["HGETALL"])
  
  fun tag hincrby(key: String, field: String, increment: I64):
    _Promise[I64]
  => "Increment the integer value of a hash field by the given number"
    _cmd[I64, _I64Result](["HINCRBY", key, field, increment.string()])
  
  fun tag hincrbyfloat(key: String, field: String, increment: F64):
    _Promise[F64]
  => "Increment the float value of a hash field by the given amount"
    _cmd[F64, _F64Result](["HINCRBYFLOAT"])
  
  // fun tag hkeys():
  //   _Promise[XXX]
  // => "Get all the fields in a hash"
  //   _cmd[XXX, _XXXResult](["HKEYS"])
  
  fun tag hlen(key: String):
    _Promise[I64]
  => "Get the number of fields in a hash"
    _cmd[I64, _I64Result](["HLEN", key])
  
  // fun tag hmget():
  //   _Promise[XXX]
  // => "Get the values of all the given hash fields"
  //   _cmd[XXX, _XXXResult](["HMGET"])
  
  fun tag hmset(key: String, pairs: ReadSeq[(String, String)]):
    _Promise[None]
  => "Set multiple hash fields to multiple values"
    let cmd = ["HMSET", key]
    for (field, value) in pairs.values() do
      cmd.push(field).push(value)
    end
    _cmd[None, _OkResult](cmd)
  
  fun tag hset(key: String, field: String, value: String):
    _Promise[Bool]
  => "Set the string value of a hash field"
    _cmd[Bool, _BoolResult](["HSET", key, field, value])
  
  fun tag hsetnx(key: String, field: String, value: String):
    _Promise[Bool]
  => "Set the value of a hash field, only if the field does not exist"
    _cmd[Bool, _BoolResult](["HSETNX", key, field, value])
  
  fun tag hstrlen(key: String, field: String):
    _Promise[I64]
  => "Get the length of the value of a hash field"
    _cmd[I64, _I64Result](["HSTRLEN", key, field])
  
  // fun tag hvals():
  //   _Promise[XXX]
  // => "Get all the values in a hash"
  //   _cmd[XXX, _XXXResult](["HVALS"])
  
  fun tag incr(key: String):
    _Promise[I64]
  => "Increment the integer value of a key by one"
    _cmd[I64, _I64Result](["INCR", key])
  
  fun tag incrby(key: String, increment: I64):
    _Promise[I64]
  => "Increment the integer value of a key by the given amount"
    _cmd[I64, _I64Result](["INCRBY", key, increment.string()])
  
  fun tag incrbyfloat(key: String, increment: F64):
    _Promise[F64]
  => "Increment the float value of a key by the given amount"
    _cmd[F64, _F64Result](["INCRBYFLOAT", key, increment.string()])
  
  fun tag info(section: String = "default"):
    _Promise[String]
  => "Get information and statistics about the server"
    _cmd[String, _BulkStringResult](["INFO", section])
  
  // fun tag keys():
  //   _Promise[XXX]
  // => "Find all keys matching the given pattern"
  //   _cmd[XXX, _XXXResult](["KEYS"])
  
  fun tag lastsave():
    _Promise[I64]
  => "Get the UNIX time stamp of the last successful save to disk"
    _cmd[I64, _I64Result](["LASTSAVE"])
  
  fun tag lindex(key: String, index: I64):
    _Promise[(String | None)]
  => "Get an element from a list by its index"
    _cmd[(String | None), _BulkStringOrNoneResult](["LINDEX", key, index.string()])
  
  fun tag linsert_before(key: String, pivot: String, value: String):
    _Promise[I64]
  => "Insert an element before or after another element in a list"
    _cmd[I64, _I64Result](["LINSERT", key, "BEFORE", pivot, value])
  
  fun tag linsert_after(key: String, pivot: String, value: String):
    _Promise[I64]
  => "Insert an element before or after another element in a list"
    _cmd[I64, _I64Result](["LINSERT", key, "AFTER", pivot, value])
  
  fun tag llen(key: String):
    _Promise[I64]
  => "Get the length of a list"
    _cmd[I64, _I64Result](["LLEN", key])
  
  fun tag lpop(key: String):
    _Promise[String]
  => "Remove and get the first element in a list"
    _cmd[String, _BulkStringResult](["LPOP", key])
  
  fun tag lpush(key: String, value: String):
    _Promise[I64]
  => "Prepend one or multiple values to a list"
    _cmd[I64, _I64Result](["LPUSH", key, value])
  
  fun tag lpushm(key: String, values: ReadSeq[String]):
    _Promise[I64]
  => "Prepend one or multiple values to a list"
    _cmd[I64, _I64Result](["LPUSH", key].append(values))
  
  fun tag lpushx(key: String, value: String):
    _Promise[I64]
  => "Prepend a value to a list, only if the list exists"
    _cmd[I64, _I64Result](["LPUSHX", key, value])
  
  // fun tag lrange():
  //   _Promise[XXX]
  // => "Get a range of elements from a list"
  //   _cmd[XXX, _XXXResult](["LRANGE"])
  
  fun tag lrem(key: String, count: I64, value: String):
    _Promise[I64]
  => "Remove elements from a list"
    _cmd[I64, _I64Result](["LREM", key, count.string(), value])
  
  fun tag lset(key: String, index: I64, value: String):
    _Promise[None]
  => "Set the value of an element in a list by its index"
    _cmd[None, _OkResult](["LSET", key, index.string(), value])
  
  fun tag ltrim(key: String, start: I64, stop: I64):
    _Promise[None]
  => "Trim a list to the specified range"
    _cmd[None, _OkResult](["LTRIM", key, start.string(), stop.string()])
  
  // fun tag mget():
  //   _Promise[XXX]
  // => "Get the values of all the given keys"
  //   _cmd[XXX, _XXXResult](["MGET"])
  
  // fun tag migrate():
  //   _Promise[XXX]
  // => "Atomically transfer a key from a Redis instance to another one."
  //   _cmd[XXX, _XXXResult](["MIGRATE"])
  
  // fun tag monitor():
  //   _Promise[XXX]
  // => "Listen for all requests received by the server in real time"
  //   _cmd[XXX, _XXXResult](["MONITOR"])
  
  fun tag move(key: String, db: I64):
    _Promise[Bool]
  => "Move a key to another database"
    _cmd[Bool, _BoolResult](["MOVE", key, db.string()])
  
  fun tag mset(pairs: ReadSeq[(String, String)]):
    _Promise[None]
  => "Set multiple keys to multiple values"
    let cmd = ["MSET"]
    for (key, value) in pairs.values() do
      cmd.push(key).push(value)
    end
    _cmd[None, _OkResult](cmd)
  
  fun tag msetnx(pairs: ReadSeq[(String, String)]):
    _Promise[Bool]
  => "Set multiple keys to multiple values, only if none of the keys exist"
    let cmd = ["MSETNX"]
    for (key, value) in pairs.values() do
      cmd.push(key).push(value)
    end
    _cmd[Bool, _BoolResult](cmd)
  
  fun tag multi():
    _Promise[None]
  => "Mark the start of a transaction block"
    _cmd[None, _OkResult](["MULTI"])
  
  // fun tag object():
  //   _Promise[XXX]
  // => "Inspect the internals of Redis objects"
  //   _cmd[XXX, _XXXResult](["OBJECT"])
  
  fun tag persist(key: String):
    _Promise[Bool]
  => "Remove the expiration from a key"
    _cmd[Bool, _BoolResult](["PERSIST", key])
  
  fun tag pexpire(key: String, millis: I64):
    _Promise[Bool]
  => "Set a key's time to live in milliseconds"
    _cmd[Bool, _BoolResult](["PEXPIRE", key, millis.string()])
  
  fun tag pexpireat(key: String, millis_timestamp: I64):
    _Promise[Bool]
  => "Set the expiration for a key as a UNIX timestamp specified in milliseconds"
    _cmd[Bool, _BoolResult](["PEXPIREAT", key, millis_timestamp.string()])
  
  fun tag pfadd(key: String, element: String):
    _Promise[Bool]
  => "Adds the specified elements to the specified HyperLogLog."
    _cmd[Bool, _BoolResult](["PFADD", key, element])
  
  fun tag pfaddm(key: String, elements: ReadSeq[String]):
    _Promise[Bool]
  => "Adds the specified elements to the specified HyperLogLog."
    _cmd[Bool, _BoolResult](["PFADD", key].append(elements))
  
  fun tag pfcount(key: String):
    _Promise[I64]
  => "Return the approximated cardinality of the set(s) observed by the HyperLogLog at key(s)."
    _cmd[I64, _I64Result](["PFCOUNT", key])
  
  fun tag pfcountm(keys: ReadSeq[String]):
    _Promise[I64]
  => "Return the approximated cardinality of the set(s) observed by the HyperLogLog at key(s)."
    _cmd[I64, _I64Result](["PFCOUNT"].append(keys))
  
  fun tag pfmerge(dest: String, sources: ReadSeq[String]):
    _Promise[None]
  => "Merge N different HyperLogLogs into a single one."
    _cmd[None, _OkResult](["PFMERGE", dest].append(sources))
  
  fun tag ping():
    _Promise[None]
  => "Ping the server"
    _cmd[None, _PongResult](["PING"])
  
  fun tag psetex(key: String, millis: I64, value: String):
    _Promise[None]
  => "Set the value and expiration in milliseconds of a key"
    _cmd[None, _OkResult](["PSETEX", key, millis.string(), value])
  
  // fun tag psubscribe():
  //   _Promise[XXX]
  // => "Listen for messages published to channels matching the given patterns"
  //   _cmd[XXX, _XXXResult](["PSUBSCRIBE"])
  
  // fun tag pubsub():
  //   _Promise[XXX]
  // => "Inspect the state of the Pub/Sub subsystem"
  //   _cmd[XXX, _XXXResult](["PUBSUB"])
  
  fun tag pttl(key: String):
    _Promise[I64]
  => "Get the time to live for a key in milliseconds"
    _cmd[I64, _I64Result](["PTTL", key])
  
  // fun tag publish():
  //   _Promise[XXX]
  // => "Post a message to a channel"
  //   _cmd[XXX, _XXXResult](["PUBLISH"])
  
  // fun tag punsubscribe():
  //   _Promise[XXX]
  // => "Stop listening for messages posted to channels matching the given patterns"
  //   _cmd[XXX, _XXXResult](["PUNSUBSCRIBE"])
  
  fun tag quit():
    _Promise[None]
  => "Close the connection"
    _cmd[None, _OkResult](["QUIT"])
  
  fun tag randomkey():
    _Promise[String]
  => "Return a random key from the keyspace"
    _cmd[String, _BulkStringResult](["RANDOMKEY"])
  
  fun tag readonly():
    _Promise[None]
  => "Enables read queries for a connection to a cluster slave node"
    _cmd[None, _OkResult](["READONLY"])
  
  fun tag readwrite():
    _Promise[None]
  => "Disables read queries for a connection to a cluster slave node"
    _cmd[None, _OkResult](["READWRITE"])
  
  fun tag rename(key: String, newkey: String):
    _Promise[None]
  => "Rename a key"
    _cmd[None, _OkResult](["RENAME", key, newkey])
  
  fun tag renamenx(key: String, newkey: String):
    _Promise[None]
  => "Rename a key, only if the new key does not exist"
    _cmd[None, _OkResult](["RENAMENX", key, newkey])
  
  fun tag restore(key: String, ttl: I64, serialized_value: String, replace: Bool = false):
    _Promise[None]
  => "Create a key using the provided serialized value, previously obtained using DUMP."
    let cmd = ["RESTORE", key, ttl.string(), serialized_value]
    if replace then cmd.push("REPLACE") end
    _cmd[None, _OkResult](cmd)
  
  // fun tag role():
  //   _Promise[XXX]
  // => "Return the role of the instance in the context of replication"
  //   _cmd[XXX, _XXXResult](["ROLE"])
  
  fun tag rpop(key: String):
    _Promise[String]
  => "Remove and get the last element in a list"
    _cmd[String, _BulkStringResult](["RPOP", key])
  
  fun tag rpoplpush(source: String, dest: String):
    _Promise[String]
  => "Remove the last element in a list, prepend it to another list and return it"
    _cmd[String, _BulkStringResult](["RPOPLPUSH", source, dest])
  
  fun tag rpush(key: String, value: String):
    _Promise[I64]
  => "Append one or multiple values to a list"
    _cmd[I64, _I64Result](["RPUSH", key, value])
  
  fun tag rpushm(key: String, values: ReadSeq[String]):
    _Promise[I64]
  => "Append one or multiple values to a list"
    _cmd[I64, _I64Result](["RPUSH", key].append(values))
  
  fun tag rpushx(key: String, value: String):
    _Promise[I64]
  => "Append a value to a list, only if the list exists"
    _cmd[I64, _I64Result](["RPUSHX", key, value])
  
  fun tag sadd(key: String, member: String):
    _Promise[I64]
  => "Add one or more members to a set"
    _cmd[I64, _I64Result](["SADD", key, member])
  
  fun tag saddm(key: String, members: ReadSeq[String]):
    _Promise[I64]
  => "Add one or more members to a set"
    _cmd[I64, _I64Result](["SADD", key].append(members))
  
  fun tag save():
    _Promise[None]
  => "Synchronously save the dataset to disk"
    _cmd[None, _OkResult](["SAVE"])
  
  fun tag scard(key: String):
    _Promise[I64]
  => "Get the number of members in a set"
    _cmd[I64, _I64Result](["SCARD", key])
  
  // fun tag script_debug():
  //   _Promise[XXX]
  // => "Set the debug mode for executed scripts."
  //   _cmd[XXX, _XXXResult](["SCRIPT DEBUG"])
  
  // fun tag script_exists():
  //   _Promise[XXX]
  // => "Check existence of scripts in the script cache."
  //   _cmd[XXX, _XXXResult](["SCRIPT EXISTS"])
  
  // fun tag script_flush():
  //   _Promise[XXX]
  // => "Remove all the scripts from the script cache."
  //   _cmd[XXX, _XXXResult](["SCRIPT FLUSH"])
  
  // fun tag script_kill():
  //   _Promise[XXX]
  // => "Kill the script currently in execution."
  //   _cmd[XXX, _XXXResult](["SCRIPT KILL"])
  
  // fun tag script_load():
  //   _Promise[XXX]
  // => "Load the specified Lua script into the script cache."
  //   _cmd[XXX, _XXXResult](["SCRIPT LOAD"])
  
  // fun tag sdiff():
  //   _Promise[XXX]
  // => "Subtract multiple sets"
  //   _cmd[XXX, _XXXResult](["SDIFF"])
  
  fun tag sdiffstore(dest: String, sources: ReadSeq[String]):
    _Promise[I64]
  => "Subtract multiple sets and store the resulting set in a key"
    _cmd[I64, _I64Result](["SDIFFSTORE", dest].append(sources))
  
  fun tag select(index: I64):
    _Promise[None]
  => "Change the selected database for the current connection"
    _cmd[None, _OkResult](["SELECT", index.string()])
  
  fun tag set(key: String, value: String):
    _Promise[Bool]
  => "Set the string value of a key"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value])
  
  fun tag setnx(key: String, value: String):
    _Promise[Bool]
  => "Set the string value of a key if it does not already exist"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "NX"])
  
  fun tag setxx(key: String, value: String):
    _Promise[Bool]
  => "Set the string value of a key only if it already exists"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "XX"])
  
  fun tag setex(key: String, value: String, seconds: I64):
    _Promise[Bool]
  => "Set the string value and expiration of a key"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "EX", seconds.string()])
  
  fun tag setexnx(key: String, value: String, seconds: I64):
    _Promise[Bool]
  => "Set the string value and expiration of a key if it does not already exist"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "EX", seconds.string(), "NX"])
  
  fun tag setexxx(key: String, value: String, seconds: I64):
    _Promise[Bool]
  => "Set the string value and expiration of a key only if it already exists"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "EX", seconds.string(), "XX"])
  
  fun tag setpx(key: String, value: String, millis: I64):
    _Promise[Bool]
  => "Set the string value and expiration (in milliseconds) of a key"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "PX", millis.string()])
  
  fun tag setpxnx(key: String, value: String, millis: I64):
    _Promise[Bool]
  => "Set the string value and expiration (in milliseconds) of a key if it does not already exist"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "PX", millis.string(), "NX"])
  
  fun tag setpxxx(key: String, value: String, millis: I64):
    _Promise[Bool]
  => "Set the string value and expiration (in milliseconds) of a key only if it already exists"
    _cmd[Bool, _OkOrNoneResult](["SET", key, value, "PX", millis.string(), "XX"])
  
  fun tag setbit(key: String, offset: I64, value: Bool):
    _Promise[I64]
  => "Sets or clears the bit at offset in the string value stored at key"
    let value': String = if value then "1" else "0" end
    _cmd[I64, _I64Result](["SETBIT", key, offset.string(), value'])
  
  fun tag setrange(key: String, offset: I64, value: String):
    _Promise[I64]
  => "Overwrite part of a string at key starting at the specified offset"
    _cmd[I64, _I64Result](["SETRANGE", key, offset.string(), value])
  
  // fun tag shutdown():
  //   _Promise[XXX]
  // => "Synchronously save the dataset to disk and then shut down the server"
  //   _cmd[XXX, _XXXResult](["SHUTDOWN"])
  
  // fun tag sinter():
  //   _Promise[XXX]
  // => "Intersect multiple sets"
  //   _cmd[XXX, _XXXResult](["SINTER"])
  
  fun tag sinterstore(dest: String, sources: ReadSeq[String]):
    _Promise[I64]
  => "Intersect multiple sets and store the resulting set in a key"
    _cmd[I64, _I64Result](["SINTERSTORE", dest].append(sources))
  
  fun tag sismember(key: String, member: String):
    _Promise[Bool]
  => "Determine if a given value is a member of a set"
    _cmd[Bool, _BoolResult](["SISMEMBER", key, member])
  
  // fun tag slaveof():
  //   _Promise[XXX]
  // => "Make the server a slave of another instance, or promote it as master"
  //   _cmd[XXX, _XXXResult](["SLAVEOF"])
  
  // fun tag slowlog():
  //   _Promise[XXX]
  // => "Manages the Redis slow queries log"
  //   _cmd[XXX, _XXXResult](["SLOWLOG"])
  
  // fun tag smembers():
  //   _Promise[XXX]
  // => "Get all the members in a set"
  //   _cmd[XXX, _XXXResult](["SMEMBERS"])
  
  fun tag smove(source: String, dest: String, member: String):
    _Promise[Bool]
  => "Move a member from one set to another"
    _cmd[Bool, _BoolResult](["SMOVE", source, dest, member])
  
  // fun tag sort():
  //   _Promise[XXX]
  // => "Sort the elements in a list, set or sorted set"
  //   _cmd[XXX, _XXXResult](["SORT"])
  
  fun tag spop(key: String):
    _Promise[String]
  => "Remove and return one or multiple random members from a set"
    _cmd[String, _BulkStringResult](["SPOP", key])
  
  // fun tag srandmember():
  //   _Promise[XXX]
  // => "Get one or multiple random members from a set"
  //   _cmd[XXX, _XXXResult](["SRANDMEMBER"])
  
  // fun tag srem():
  //   _Promise[XXX]
  // => "Remove one or more members from a set"
  //   _cmd[XXX, _XXXResult](["SREM"])
  
  // fun tag strlen():
  //   _Promise[XXX]
  // => "Get the length of the value stored in a key"
  //   _cmd[XXX, _XXXResult](["STRLEN"])
  
  // fun tag subscribe():
  //   _Promise[XXX]
  // => "Listen for messages published to the given channels"
  //   _cmd[XXX, _XXXResult](["SUBSCRIBE"])
  
  // fun tag sunion():
  //   _Promise[XXX]
  // => "Add multiple sets"
  //   _cmd[XXX, _XXXResult](["SUNION"])
  
  // fun tag sunionstore():
  //   _Promise[XXX]
  // => "Add multiple sets and store the resulting set in a key"
  //   _cmd[XXX, _XXXResult](["SUNIONSTORE"])
  
  // fun tag sync():
  //   _Promise[XXX]
  // => "Internal command used for replication"
  //   _cmd[XXX, _XXXResult](["SYNC"])
  
  // fun tag time():
  //   _Promise[XXX]
  // => "Return the current server time"
  //   _cmd[XXX, _XXXResult](["TIME"])
  
  // fun tag ttl():
  //   _Promise[XXX]
  // => "Get the time to live for a key"
  //   _cmd[XXX, _XXXResult](["TTL"])
  
  // fun tag type():
  //   _Promise[XXX]
  // => "Determine the type stored at key"
  //   _cmd[XXX, _XXXResult](["TYPE"])
  
  // fun tag unsubscribe():
  //   _Promise[XXX]
  // => "Stop listening for messages posted to the given channels"
  //   _cmd[XXX, _XXXResult](["UNSUBSCRIBE"])
  
  // fun tag unwatch():
  //   _Promise[XXX]
  // => "Forget about all watched keys"
  //   _cmd[XXX, _XXXResult](["UNWATCH"])
  
  // fun tag wait():
  //   _Promise[XXX]
  // => "Wait for the synchronous replication of all the write commands sent in the context of the current connection"
  //   _cmd[XXX, _XXXResult](["WAIT"])
  
  // fun tag watch():
  //   _Promise[XXX]
  // => "Watch the given keys to determine execution of the MULTI/EXEC block"
  //   _cmd[XXX, _XXXResult](["WATCH"])
  
  // fun tag zadd():
  //   _Promise[XXX]
  // => "Add one or more members to a sorted set, or update its score if it already exists"
  //   _cmd[XXX, _XXXResult](["ZADD"])
  
  // fun tag zcard():
  //   _Promise[XXX]
  // => "Get the number of members in a sorted set"
  //   _cmd[XXX, _XXXResult](["ZCARD"])
  
  // fun tag zcount():
  //   _Promise[XXX]
  // => "Count the members in a sorted set with scores within the given values"
  //   _cmd[XXX, _XXXResult](["ZCOUNT"])
  
  // fun tag zincrby():
  //   _Promise[XXX]
  // => "Increment the score of a member in a sorted set"
  //   _cmd[XXX, _XXXResult](["ZINCRBY"])
  
  // fun tag zinterstore():
  //   _Promise[XXX]
  // => "Intersect multiple sorted sets and store the resulting sorted set in a new key"
  //   _cmd[XXX, _XXXResult](["ZINTERSTORE"])
  
  // fun tag zlexcount():
  //   _Promise[XXX]
  // => "Count the number of members in a sorted set between a given lexicographical range"
  //   _cmd[XXX, _XXXResult](["ZLEXCOUNT"])
  
  // fun tag zrange():
  //   _Promise[XXX]
  // => "Return a range of members in a sorted set, by index"
  //   _cmd[XXX, _XXXResult](["ZRANGE"])
  
  // fun tag zrangebylex():
  //   _Promise[XXX]
  // => "Return a range of members in a sorted set, by lexicographical range"
  //   _cmd[XXX, _XXXResult](["ZRANGEBYLEX"])
  
  // fun tag zrevrangebylex():
  //   _Promise[XXX]
  // => "Return a range of members in a sorted set, by lexicographical range, ordered from higher to lower strings."
  //   _cmd[XXX, _XXXResult](["ZREVRANGEBYLEX"])
  
  // fun tag zrangebyscore():
  //   _Promise[XXX]
  // => "Return a range of members in a sorted set, by score"
  //   _cmd[XXX, _XXXResult](["ZRANGEBYSCORE"])
  
  // fun tag zrank():
  //   _Promise[XXX]
  // => "Determine the index of a member in a sorted set"
  //   _cmd[XXX, _XXXResult](["ZRANK"])
  
  // fun tag zrem():
  //   _Promise[XXX]
  // => "Remove one or more members from a sorted set"
  //   _cmd[XXX, _XXXResult](["ZREM"])
  
  // fun tag zremrangebylex():
  //   _Promise[XXX]
  // => "Remove all members in a sorted set between the given lexicographical range"
  //   _cmd[XXX, _XXXResult](["ZREMRANGEBYLEX"])
  
  // fun tag zremrangebyrank():
  //   _Promise[XXX]
  // => "Remove all members in a sorted set within the given indexes"
  //   _cmd[XXX, _XXXResult](["ZREMRANGEBYRANK"])
  
  // fun tag zremrangebyscore():
  //   _Promise[XXX]
  // => "Remove all members in a sorted set within the given scores"
  //   _cmd[XXX, _XXXResult](["ZREMRANGEBYSCORE"])
  
  // fun tag zrevrange():
  //   _Promise[XXX]
  // => "Return a range of members in a sorted set, by index, with scores ordered from high to low"
  //   _cmd[XXX, _XXXResult](["ZREVRANGE"])
  
  // fun tag zrevrangebyscore():
  //   _Promise[XXX]
  // => "Return a range of members in a sorted set, by score, with scores ordered from high to low"
  //   _cmd[XXX, _XXXResult](["ZREVRANGEBYSCORE"])
  
  // fun tag zrevrank():
  //   _Promise[XXX]
  // => "Determine the index of a member in a sorted set, with scores ordered from high to low"
  //   _cmd[XXX, _XXXResult](["ZREVRANK"])
  
  // fun tag zscore():
  //   _Promise[XXX]
  // => "Get the score associated with the given member in a sorted set"
  //   _cmd[XXX, _XXXResult](["ZSCORE"])
  
  // fun tag zunionstore():
  //   _Promise[XXX]
  // => "Add multiple sorted sets and store the resulting sorted set in a new key"
  //   _cmd[XXX, _XXXResult](["ZUNIONSTORE"])
  
  // fun tag scan():
  //   _Promise[XXX]
  // => "Incrementally iterate the keys space"
  //   _cmd[XXX, _XXXResult](["SCAN"])
  
  // fun tag sscan():
  //   _Promise[XXX]
  // => "Incrementally iterate Set elements"
  //   _cmd[XXX, _XXXResult](["SSCAN"])
  
  // fun tag hscan():
  //   _Promise[XXX]
  // => "Incrementally iterate hash fields and associated values"
  //   _cmd[XXX, _XXXResult](["HSCAN"])
  
  // fun tag zscan():
  //   _Promise[XXX]
  // => "Incrementally iterate sorted sets elements and associated scores"
  //   _cmd[XXX, _XXXResult](["ZSCAN"])
