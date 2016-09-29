
use "collections"
use "net"

actor Redis is RedisAPI
  let _auth: TCPConnectionAuth
  var _conn: (TCPConnection | None) = None
  
  embed outgoing: Array[ByteSeqIter] = Array[ByteSeqIter]
  embed promises: List[_PromiseAny]  = List[_PromiseAny]
  
  new create(auth': TCPConnectionAuth) =>
    _auth = auth'
  
  be connect(host': String, port': String) =>
    _conn = TCPConnection(_auth, _TCPNotify(this), host', port')
  
  be _connected(conn': TCPConnection) =>
    for o in outgoing.values() do conn'.writev(o) end
    outgoing.clear()
  
  be _send(m: ByteSeqIter, p: _PromiseAny) =>
    try (_conn as TCPConnection).writev(m) else outgoing.push(m) end
    promises.push(p)
  
  be _received(r: _Result) =>
    try promises.shift()._fulfill(r) end
  
  be _received_error(e: _Error) =>
    try promises.shift()._reject(e) end
  
  fun tag _cmd[A: Any val, T: _TransformResult[A]](command: ReadSeq[String]): _Promise[A] =>
    let p = T.promise()
    _send(_Encode(command), p)
    p

class iso _TCPNotify is TCPConnectionNotify
  let redis: Redis
  let decode: _Decoder = _Decoder
  
  new iso create(redis': Redis) =>
    redis = redis'
  
  fun ref connected(conn: TCPConnection ref) =>
    redis._connected(conn)
  
  fun ref received(conn: TCPConnection ref, data: Array[U8] iso) =>
    decode(consume data)
    try while true do
      match decode.next()
      | let r: _Result => redis._received(r)
      | let e: _Error  => redis._received_error(e)
      else error
      end
    end end
