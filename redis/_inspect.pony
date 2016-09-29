
primitive _Inspect
  fun apply(r': (_Result | _Error), buf': String iso = recover String end): String iso^ =>
    var buf = consume buf'
    match r'
    | let r: None         => buf.append("None")
    | let r: I64          => buf.append(r.string())
    | let r: String       => buf.push('"'); buf.append(r.string()); buf.push('"')
    | let r: _Error       => buf.push('('); buf.append(r.string()); buf.push(')')
    | let r: _ResultArray =>
      buf.push('[')
      let iter = r.values()
      for e in iter do
        buf = apply(e, consume buf)
        if iter.has_next() then buf.append(", ") end
      end
      buf.push(']')
    end
    buf
