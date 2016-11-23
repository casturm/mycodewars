require 'minitest/autorun'

class BreakingChocolate < MiniTest::Unit::TestCase
  def break_chocolate(n, m)
    if (n == 0 or m == 0) or (n == 1 and m == 1)
      0
    else
      if n > 1
        n1 = 1
        n2 = m
        m1 = n - 1
        m2 = m
      elsif m > 1
        m1 = 1
        m2 = n
        n1 = m - 1
        n2 = n
      end
      1 + break_chocolate(n1, n2) + break_chocolate(m1, m2)
    end
  end

  def test_2x1
    assert_equal 1, break_chocolate(2, 1)
  end

  def test_1x2
    assert_equal 1, break_chocolate(1, 2)
  end

  def test_2x2
    assert_equal 3, break_chocolate(2, 2)
  end

  def test_3x2
    assert_equal 5, break_chocolate(3, 2)
  end

  def test_3x3
    assert_equal 8, break_chocolate(3, 3)
  end

  def test_5x5
    assert_equal 24, break_chocolate(5, 5)
  end
end
