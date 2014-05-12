# Find the sum of the digits in the number 100!

sum = (1..100).inject(&:*).to_s
digits = sum.split('').map(&:to_i)
sum_of_digits = digits.inject(&:+)

puts sum_of_digits
