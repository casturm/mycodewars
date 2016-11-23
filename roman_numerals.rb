class RomanNumeral

  ROMAN = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }
  
  def convert(roman)
    regex = Regexp.new(ROMAN.keys.join('|'))
    roman.scan(regex).reduce(0) { |sum, k| sum + ROMAN[k] }
  end
end
