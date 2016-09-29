
primitive _Encode
  fun apply(input: ReadSeq[String]): Array[String] val =>
    let size = 3 + (5 * input.size())
    let output = recover trn Array[String](size) end
    
    output.push("*")
    output.push(input.size().string())
    output.push("\r\n")
    
    for str in input.values() do
      output.push("$")
      output.push(str.size().string())
      output.push("\r\n")
      output.push(str)
      output.push("\r\n")
    end
    
    consume output
