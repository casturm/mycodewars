require 'prime'

def prime_factors(n)
  factor = (Prime.each(n).find{|p| n%p == 0 } || 0)
  if factor == 0
    []
  else
    prime_factors(n / factor).unshift(factor)
  end
end

def radical(primes)
  primes.uniq.reduce(:*) || 1
end

def all_radicals(n)
  (1..n).map{|x| {n: x, k: radical(prime_factors(x))} }
end

def sorted_radicals(n)
  all_radicals(n).sort { |a,b| (a[:k] <=> b[:k]).nonzero? || a[:n] <=> b[:n] }
end

n = (ARGV[0] || '0').to_i
k = (ARGV[1] || '0').to_i
primes = prime_factors(n)
puts "factors: #{primes}"
puts "prime factors: #{primes.uniq}"
puts "radical: #{radical(primes)}"
puts "all_radicals: #{all_radicals(n)}"
puts "sorted: #{sorted_radicals(n)}"
puts "k: #{sorted_radicals(n)[k-1][:n]}"
