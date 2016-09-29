
type _Result is (None | I64 | String | _ResultArray)

class val _ResultArray is ReadSeq[_Result]
  embed _inner: Array[_Result] = Array[_Result]
  fun size(): USize => _inner.size()
  fun apply(i: USize): _Result? => _inner(i)
  fun values(): Iterator[_Result] => _inner.values()
  fun ref push(r: _Result) => _inner.push(r)

trait val _TransformResult[A: Any val]
  new val create()
  fun val apply(r: _Result): (A | _Error)
  fun val promise(): _Promise[A] => _Promise[A](this)

primitive _BulkStringResult is _TransformResult[String]
  fun apply(r: _Result): (String | _Error) =>
    try r as String else _Error("NOTASTRING", "not a string at all!") end

primitive _I64Result is _TransformResult[I64]
  fun apply(r: _Result): (I64 | _Error) =>
    try r as I64 else _Error("NOTANINTEGER", "not a integer at all!") end

primitive _F64Result is _TransformResult[F64]
  fun apply(r: _Result): (F64 | _Error) =>
    try @atof[F64]((r as String).null_terminated().cstring()) // TODO: avoid atof
    else _Error("NOTASTRING", "not a string at all!")
    end

primitive _BoolResult is _TransformResult[Bool]
  fun apply(r: _Result): (Bool | _Error) =>
    try (r as I64) != 0 else _Error("NOTANINTEGER", "not an integer at all!") end

primitive _OkResult is _TransformResult[None]
  fun apply(r: _Result): (None | _Error) =>
    match r | "OK" => None else _Error("NOTOK", "not okay at all!") end

primitive _PongResult is _TransformResult[None]
  fun apply(r: _Result): (None | _Error) =>
    match r | "PONG" => None else _Error("NOTPONG", "not pong at all!") end

primitive _BulkStringOrNoneResult is _TransformResult[(String | None)]
  fun apply(r: _Result): (String | None | _Error) =>
    match r
    | let r': String => r'
    | None => None
    else _Error("NOTASTRINGORNONE", "not a string or none at all!")
    end

primitive _OkOrNoneResult is _TransformResult[Bool]
  fun apply(r: _Result): (Bool | _Error) =>
    match r
    | "OK" => true
    | None => false
    else _Error("NOTOKORNONE", "not okay or none at all!")
    end
