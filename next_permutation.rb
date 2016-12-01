number = ARGV[0] || 0
pivot = -1
succ = -1
(number.size-1).downto(0) do |i|
  #puts "#{number[i-1]} #{number[i]}"
  #puts "#{number[i-1].to_i < number[i].to_i}"
  pivot = i-1
  break if number[pivot].to_i < number[i].to_i
end
(number.size-1).downto(pivot+1) do |i|
  #puts "#{pivot} #{number[pivot]} #{number[i]}"
  #puts "#{number[i] > number[pivot]}"
  succ = i
  break if number[i] > number[pivot]
end

puts "#{number.chars.zip([*0..number.chars.size-1])}"
puts "#{number.chars}"
puts "#{number.size}"
puts "#{pivot}"
puts "#{succ}"

if pivot >= 0 && succ >= 0
  nxt_perm = String.new(number)
  nxt_perm[pivot] = number[succ]
  nxt_perm[succ] = number[pivot]
  nxt_perm = nxt_perm[0,pivot+1] + nxt_perm[pivot+1,number.size].chars.reverse.join
end

puts "number  : #{number}"
puts "nxt_perm: #{nxt_perm}"
