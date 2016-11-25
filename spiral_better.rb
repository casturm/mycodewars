
def spiralize(size)
  return [] if size == 0
  return [[1]] if size == 1
  return [[1,1],[0,1]] if size == 2
  add_layer(spiralize(size-2))
end

def add_layer(square)
  2.times { square = add_rows(rotate(square)) }
  square
 end

def rotate(square)
  square.reverse.transpose
end

def add_rows(array)  
  row_length = array.first.count
  array.unshift(Array.new(row_length -1 ,0)+ [1])
  array.unshift(Array.new(row_length, 1))
end
