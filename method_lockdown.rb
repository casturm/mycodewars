undef rand
undef srand

class << Kernel
  undef rand
  undef srand
end

class Random
  undef rand
  #undef srand
end

class << Random
  undef rand
  undef srand
end

class Array
  undef shuffle
  undef sample
end

def test(&block)
  begin
    yield
    puts "expected an exception for #{block}"
  rescue StandardError => e
    puts e
  end
end

test{ rand }
test{ srand }
test{ Kernel.rand }
test{ Object.send(:rand) }
test{ Object.send(:srand) }
test{ Random.send(:rand) }
test{ Random.send(:srand) }
test{ Array.new.sample }
test{ Array.new.shuffle }
