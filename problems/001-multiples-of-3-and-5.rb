list = (1...1000).each_with_object([]){ |i, array| array << i if i % 5 == 0 || i % 3 == 0 }

puts list.inject(&:+)
