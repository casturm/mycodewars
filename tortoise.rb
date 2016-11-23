def race(v1, v2, g)
  puts "#{v1} #{v2} #{g} #{v1 / 3600.0} #{v2 / 3600.0}"
  result = nil
  d = 0
  t = -1 
  if v1 < v2
    loop do
      if d >= g
        puts "#{t} #{d} #{g}"
        result = [t / 3600, (t % 3600) / 60, (t % 3600) % 60]
        break
      end
      g += v1 / 3600.0
      d += v2 / 3600.0
      t += 1
    end
  end
  result
end
