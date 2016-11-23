def part(n)
  (1..n).map do |part|
    enum(n, part)
  end
end

def enum(n, part)
  remainder = n - part
  if remainder < 0
    []
  else
    enum(remainder, part).unshift(part)
  end
end

n = (ARGV[0] || 0).to_i
puts "#{part(n)}"
