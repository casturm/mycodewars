def five
   5
end

def seven op
  op.call(7)
end

def times f2 
  -> (f1) { f1 * f2 }
end

