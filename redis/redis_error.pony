
type RedisError is _Error

class val _Error
  let code: String
  let message: String
  new val create(c: String, m: String) => (code, message) = (c, m)
  
  new val _from_string(s: String) =>
    let space_index = try s.offset_to_index(s.find(" ")) else 0 end
    (code, message) = (s.trim(0, space_index), s.trim(space_index + 1, -1))
  
  fun string(): String =>
    let out = recover trn String end
    out.append(code)
    out.push(' ')
    out.append(message)
    consume out
