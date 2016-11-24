def count_dups(word)
  word.reduce({}) { |d, l| d[l] = word.count(l); d }
end

def dups_factorial(perm)
  count_dups(perm).values.reduce(1) { |d, p| d *= factorial(p) }
end

def rank(word)
  sorted = word.chars.sort.join
  perm_left = sorted.chars
  perm = []
  counts = []
  r = 1
  n = word.size
  (0..n-1).each do |si|
    pi = 0
    loop do
      if perm_left[pi] == word[si]
        #perm << perm_left[pi]
        perm_left.delete_at(pi)
        #puts "#{pi} #{perm_left[pi]} #{word[si]}"
        break
      else
        count = perm_left.size - 1
        r += factorial(count) / dups_factorial(perm_left)
        #counts << r
        #puts "\n#{perm.join} #{perm_left.join} #{count}! / #{dups_factorial(perm_left)} = #{r}"
      end
      pi += 1
    end
  end
  #counts
  r
end

def factorial(n)
  (1..n).reduce(:*) || 1
end

def sort(word)
  puts "** #{word} **"
  sorted = word.chars.sort.join
  last_sorted = nil
  size = sorted.size
  index = 0
  loop do
    puts "#{last_sorted} #{sorted} #{index}"
    index += 1 unless sorted == last_sorted
    last_sorted = sorted
    i = first(sorted)
    break if word == sorted || i == -1
    s = second(sorted, sorted[i], i + 1, size - 1)
    sorted = swap(sorted, i, s)
    sorted = reverse(sorted, i + 1, size - 1)
  end
  index
end

def sort_with_dups(word)
  duplicates = word.size - word.chars.uniq.size
  dups_fact = (1..duplicates).reduce(:*)
  puts "#{duplicates} #{dups_fact}"
  puts "** #{word} #{(1..word.size).reduce(:*) / (dups_fact == 0 ? 1 : dups_fact)} **"
  sorted = word.chars.sort.join
  size = sorted.size
  index = 0
  loop do
    puts "#{sorted}"
    i = first(sorted)
    break if i == -1
    s = second(sorted, sorted[i], i + 1, size - 1)
    sorted = swap(sorted, i, s)
    sorted = sort_sub(sorted, i + 1, size - 1)
  end
  index
end

def second(word, first, l, h)
  second_index = l
  (l+1..h).each do |i|
    if word[i] > first && word[i] < word[second_index]
      second_index = i
    end
  end
  second_index
end

def first(word)
  first = nil
  (word.size - 2).downto(0) do |i|
    if word[i] < word[i+1]
      first = i
      break
    end
  end
  first || -1
end

def swap(word, l, h)
  chars = word.chars
  t = chars[l]
  chars[l] = chars[h]
  chars[h] = t
  chars.join
end

def reverse(word, l, h)
  word.slice(0,l) + word.slice(l, h).chars.reverse.join
end

def sort_sub(word, l, h)
  word.slice(0,l) + word.slice(l, h).chars.sort.join
end

def all(word)
  require 'set'
  word.chars.permutation(word.size).map(&:join).sort
end

def permute(str, out)
  # When size of str becomes 0, out has a
  # permutation (length of out is n)
  if str.size == 0
    puts "#{out}"
    return
  end

  # One be one move all characters at
  # the beginning of out (or result)
  #for (int i = 0; i < str.size(); i++)
  (0..str.size).each do |i|
    # Remove first character from str and
    # add it to out
    permute(str.slice(1, str.size - 1), out + str[0]);

    # Rotate string in a way second character
    # moves to the beginning.
    #rotate(str.begin(), str.begin() + 1, str.end());
  end
end

