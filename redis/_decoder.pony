
use buffered = "buffered"

class _Decoder
  embed buf: buffered.Reader = buffered.Reader
  embed array_stack: Array[(_ResultArray trn, USize)] = Array[(_ResultArray trn, USize)]
  
  fun ref apply(data: Array[U8] val) =>
    buf.append(data)
  
  fun ref next(): (_Result | _Error)? =>
    var tail_retry = false
    
    let res: (_Result | _Error) = match buf.peek_u8()
    | '+' => _res(buf.line().trim(1))                // string
    | '-' => _err(buf.line().trim(1))                // error
    | ':' => _res(_i64(buf.line().trim(1)).string()) // integer
    | '$' =>                                         // bulk string
      (var size, let offset) = _i64_peek()
      var is_none = false
      if size < 0 then (size, is_none) = (0, true) end
      
      if buf.size() < (offset + size.usize() + 4) then error end
      buf.line() // discard, already peeked
      let string = buf.line()
      
      _res(if is_none then None else string end)
    | '*' =>                                         // array
      var size = _i64(buf.line().trim(1))
      
      if size < 0 then
        _res(None)
      elseif size == 0 then
        _res(_ResultArray)
      else
        array_stack.push((_ResultArray, size.usize()))
        tail_retry = true
        0
      end
    else buf.u8(); tail_retry = true; 0 // move to the next byte and retry
    end
    
    if tail_retry then next() else res end
  
  fun ref _res(r: _Result): _Result? =>
    var need_more = false
    try
      (let array, let count) = array_stack.pop()
      array.push(r)
      if array.size() >= count then
        _res(consume array)
      else
        array_stack.push((consume array, count))
        need_more = true
        error
      end
    else
      if need_more then error else r end
    end
  
  fun tag _err(s: String): _Error => _Error._from_string(s)
  
  fun tag _i64(s: String): I64 =>
    var out: I64 = 0
    for c in s.values() do out = _i64_digit(c, out) end
    out
  
  fun _i64_peek(): (I64, USize)? =>
    var offset: USize = 1
    var number: I64   = 0
    while true do
      match buf.peek_u8(offset)
      | '\r' | '\n' => break
      | let c: U8   => number = _i64_digit(c, number)
      end
      offset = offset + 1
    end
    (number, offset)
  
  fun tag _i64_digit(digit: U8, input: I64): I64 =>
    if (digit >= '0') and (digit <= '9') then
      -input
    elseif digit == '-' then
      (input * 10) + (digit - '0').i64()
    else
      input
    end
