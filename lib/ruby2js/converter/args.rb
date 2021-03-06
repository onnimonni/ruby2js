module Ruby2JS
  class Converter

   # (args
   #   (arg :a)
   #   (restarg :b)
   #   (blockarg :c))

    handle :args do |*args|
      parse_all(*args, join: ', ')
    end

    handle :mlhs do |*args|
      if es2015
        put '['
        parse_all(*args, join: ', ')
        put ']'
      else
        raise Error.new("destructuring requires ES2015", @ast)
      end
    end
  end
end
