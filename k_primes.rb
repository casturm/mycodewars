require 'prime'

def k_prime(n)
  Prime.prime_division(n).reduce(0) {|s,f| s += f[1]}
end
