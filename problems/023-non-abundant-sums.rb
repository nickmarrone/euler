# A perfect number is a number for which the sum of its proper divisors is exactly equal to the
# number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which
# means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called
# abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be
# written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all
# integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper
# limit cannot be reduced any further by analysis even though it is known that the greatest number
# that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant
# numbers.

require '../lib/fixnum'
require 'set'

# all_numbers = Hash.new{ |hash, key| hash[key] = 0 }
all_numbers = {}
abundant_numbers = []
upper_limit = 28123

(12...upper_limit).each do |num|
  abundant_numbers << num if num.abundant?
end

# Set to '1' if number is the sum of two abundant numbers
loop do
  num = abundant_numbers[0]
  abundant_numbers.each do |x|
    sum = num + x
    all_numbers[sum] = 1 unless sum > upper_limit
  end

  # Drop the number after since we are counting an abundant number added to itself
  abundant_numbers.shift
  break if abundant_numbers.length == 0
end

# Sum up all numbers that are not the sum of two abundant numbers
total = 0
(1...(upper_limit+1)).each do |num|
  total += num if all_numbers[num] == nil
end

puts total
