num1.to_s.scan(/(\d)\1\1/).select{|n| num2.to_s.scan(/(#{n})\1/).count > 0}.count > 0 ? 1 : 0
