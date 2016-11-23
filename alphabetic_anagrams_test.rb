require 'minitest/spec'
require 'minitest/autorun'

require_relative 'alphabetic_anagrams'

describe 'AlphabeticAnagrams' do
  describe '#swap' do
    it 'swaps chars by index in CBA' do
      assert_equal 'ABC', swap('CBA', 0, 2)
      assert_equal 'BCA', swap('CBA', 0, 1)
      assert_equal 'CAB', swap('CBA', 1, 2)
      assert_equal 'CAB', swap('CBA', 2, 1)
    end
  end

  describe '#first' do
    it 'finds the rightmost char which is smaller than its next char' do
      assert_equal 1, first('ABC')
      assert_equal 0, first('ACB')
      assert_equal 4, first('ACBFDE')
      assert_equal 3, first('ACBDFE')
      assert_equal 4, first('ABCDEF')
      assert_equal 2, first('CFDEBA')
      assert_equal 2, first('ABCD')
      assert_equal 2, first('ACBD')
      assert_equal 1, first('ACDB')
      assert_equal 0, first('ADCB')
      assert_equal 0, first('AEDCB')
    end
  end

  describe '#second' do
    it 'finds the smallest char to the right of the first' do
      assert_equal 1, second('ABCD', 'A', 1, 3)
      assert_equal 2, second('ACBD', 'A', 1, 3)
      assert_equal 2, second('ACDB', 'C', 2, 3)
      assert_equal 3, second('ADCB', 'A', 1, 3)
    end

    it 'finds the second char using #first' do
      assert_equal 3, second_from_first('ABCD')
      assert_equal 3, second_from_first('ACBD')
      assert_equal 2, second_from_first('ACDB')
      assert_equal 3, second_from_first('ADCB')
    end
  end

  def second_from_first(string)
    second(string, string[first(string)], first(string) + 1, string.size - 1)
  end

  describe '#sort' do
    it 'should find the index of the string' do 
      assert_equal 24, sort('DCBA')
      assert_equal 1, sort('A')
      assert_equal 1, sort('AAAB')
      puts "****"
      assert_equal 0, sort('ABAB')
      puts "****"
    end
  end
end
