def binary(number)
  (number % 2).to_s
end

def binary_string(number)
  number = number % 2**32 if number < 0
  if number == 0
    ''
  else
    binary_string(number / 2) + binary(number)
  end
end

number = (ARGV[0] || '0').to_i
puts binary_string(number).ljust(32, '0')
