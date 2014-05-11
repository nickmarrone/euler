number = 2 ** 1000

digits = number.to_s.split('')

puts digits.inject(0){ |sum, n| sum += n.to_i; sum }
