
use "debug"

actor Main
  new create(env: Env) =>
    try
      let redis = Redis(env.root as AmbientAuth)
      
      redis.connect("localhost", "6379")
      
      redis.echo("Hello world").success(recover lambda(r: String)(redis) =>
        Debug("success: " + _Inspect(r))
      end end).failure(recover lambda(e: RedisError)(redis) =>
        Debug("failure: " + _Inspect(e))
      end end)
      
      env.out.print("started!")
    end
