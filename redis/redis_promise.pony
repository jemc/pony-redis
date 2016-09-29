
use "collections"

type RedisPromise[A: Any val] is _Promise[A]

interface tag _PromiseAny
  be _fulfill(r: _Result)
  be _reject(r: _Error)

primitive _PromisePending

actor _Promise[A: Any val]
  let _trans: _TransformResult[A]
  var _value: (A | _Error | _PromisePending) = _PromisePending
  let _success_fns: List[{(A)} val]      = List[{(A)} val]      // TODO: use embed
  let _failure_fns: List[{(_Error)} val] = List[{(_Error)} val] // TODO: use embed
  
  new create(t: _TransformResult[A]) => _trans = t
  
  be success(fn: {(A)} val) =>
    try fn(_value as A) else _success_fns.push(fn) end
  
  be failure(fn: {(_Error)} val) =>
    try fn(_value as _Error) else _failure_fns.push(fn) end
  
  be _fulfill(r: _Result) =>
    match _trans(r)
    | let a: A =>
      for fn in _success_fns.values() do fn(a) end
      _success_fns.clear()
      _value = a
    | let e: _Error =>
      for fn in _failure_fns.values() do fn(e) end
      _failure_fns.clear()
      _value = e
    end
  
  be _reject(e: _Error) =>
    for fn in _failure_fns.values() do fn(e) end
    _failure_fns.clear()
    _value = e
