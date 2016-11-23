class Cipher
  attr_reader :shift
  attr_reader :range

  def initialize(shift)
    @rotate = ('A'..'Z').to_a.rotate(shift).join
  end

  def encode(string)
    string.upcase.tr 'A-Z', @rotate
  end

  def decode(string)
    string.tr @rotate, 'A-Z'
  end
end
