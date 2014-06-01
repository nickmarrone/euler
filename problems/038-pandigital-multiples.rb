# Take the number 192 and multiply it by each of 1, 2, and 3:

# 192 × 1 = 192 192 × 2 = 384 192 × 3 = 576 By concatenating each product we get the 1 to 9
# pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the
# pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product
# of an integer with (1,2, ... , n) where n > 1?

def pandigital?(num_string)
  num_string.split('').sort.join('') == '123456789'
end

def possible_pandigital_number(num)
  temp = num.to_s
  n = 2
  loop do
    temp << (num * n).to_s
    n += 1

    break if temp.length >= 9
  end

  temp
end

def pandigital_multiple?(num)
  pandigital?(possible_pandigital_number(num))
end


pandigital_multiples = []
(1..9999).each do |x|
  pandigital_multiples << x if pandigital_multiple?(x)
end

puts pandigital_multiples.map{ |n| possible_pandigital_number(n) }.sort.last
