class Spiral

  attr_accessor :spiral, :len, :step, :turn, :right, :down, :left, :up, :x, :y

  def initialize(n)
    @spiral = Array.new(n) { Array.new(n, '. ') }
    @step = 0 
    @turn = 0
    @right = n - 1
    @down = n - 1
    @left = 0
    @up = 0
    @len = n
  end

  def spiralize
    loop do

      info
      break if right - left < 0
      (left..right).each do |n|
        walk(up, n)
      end
      @turn += 1
      @up += 1
      @len -=1 unless @right == @step # first time

      info
      break if down - up < 0
      (up..down).each do |n|
        walk(n, right)
      end
      @turn += 1
      @right -= 1

      info
      break if right - left < 0
      right.downto(left).each do |n|
        walk(down, n)
      end
      @turn += 1
      @down -= 1
      @len -= 1

      info
      break if down - up < 0
      down.downto(up).each do |n|
        walk(n, left)
      end
      @turn += 1
      @left += 1
    end

    print_spiral 
    spiral

  end

  def walk(x, y)
    puts " (#{x},#{y}) = #{step}"
    spiral[x][y] = step.to_s.rjust(2, '0')
    @step += 1
  end

  def info
    puts "step: #{step} turn: #{turn} right: #{right} down: #{down} left: #{left} up: #{up}"
  end

  def print_spiral
    spiral.each do |s|
      puts "#{s}" 
    end
  end
end

def spiral(n)
  Spiral.new(n).spiralize
end
