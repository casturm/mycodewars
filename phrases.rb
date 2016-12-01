
MAP = '1-----ABC2-DEF3-GHI4-JKL5-MNO6-PQRS7TUV8-WXYZ9 0'

def presses(phrase)
  puts "#{phrase}"
  puts "#{phrase.chars.map(&:ord)}"
  phrase.chars.reduce(0) do |s,l| 
    s += count(l)
  end
end

def count(l)
  puts "#{l} #{MAP.index(l)} #{MAP.index(l) %  5}"
  MAP.index(l) % 5
end
