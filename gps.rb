def gps(s, x)
  puts "#{s} #{x} #{x.each_cons(2).map {|b,e| (e-b) / s}}"
  puts "#{x.each_cons(2).map {|b,e| s / (e-b)}.max}"
  x.each_cons(2).map {|b,e| s / (e-b)}.max.floor
end
