# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require '../lib/fixnum'

solutions = []

def sum_of_the_factorial_of_digits(num)
  num.to_a.map{ |n| n.factorial }.inject(&:+)
end

# Can't have more than 8 digits because the size of the number
# greatly exceeds the sum of factorials
(1..25).each { |x| puts "#{x}: #{9.factorial * x}" }

top = 9.factorial * 7

(3..top).each do |n|
  solutions << n if n == sum_of_the_factorial_of_digits(n)
end

puts solutions.inject(&:+)
