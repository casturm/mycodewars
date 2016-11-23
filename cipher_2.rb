class Cipher
  def cipher
    ('A'..'Z').to_a + ('a'..'z').to_a
  end

  def rotate(n)
    cipher.rotate(n).join
  end

  def encode(u, n)
    u.tr 'A-Za-z', rotate(n)
  end

  def chunks(e)
    (e.size / 5.0).ceil
  end

  def encode_str(u, n)
    first = u.slice(0).downcase
    e = first + encode(first, n) + encode(u, n)
    e.scan(/.{,#{chunks(e)}}/).reject(&:empty?)
  end

  def decode_str(e, n)
    e.tr rotate(n), 'A-Za-z'
  end
  
  def decode_n(prefix)
    cipher.index(prefix.last) - cipher.index(prefix.first)
  end

  def decode(arr)
    prefix = arr.first.chars.shift(2)
    n = decode_n(prefix)
    e = arr[0].chars.drop(2).join + arr.drop(1).join
    decode_str(e, n)
  end
end
