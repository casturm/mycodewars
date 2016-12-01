def pascalsTriangle(n)
  triangle = Array.new(n, Array.new)
  (0..n).each do |line|
    (0..line).each do |i|
      if line == 0
        triangle[line][i] = 1
      else
        above_left = triangle[line-1][i-1] || 0
        above_right = triangle[line-1][i] || 0
        puts "above_left[#{line-1}][#{i-1}] #{above_left} + above_right[#{line-1}][#{i}]: #{above_right} => triangle[#{line}][#{i}] = #{above_left + above_right}\n"
        triangle[line] << above_left + above_right
      end
      #printf "%d", triangle[line][i]
    end
    puts
  end
end
