# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into
# n). If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are
# called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore
# d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

require '../lib/fixnum'

number_divisor_sums = {}
(2...10_000).each do |num|
  number_divisor_sums[num] = num.factors.reject{|n| n == num}.inject(&:+)
end

amicable_numbers = []

number_divisor_sums.each do |key, val|
  if key != val && number_divisor_sums[val] == key
    amicable_numbers << key # Only add the key because it will go through and check the val as well
  end
end

p amicable_numbers.inject(&:+)
