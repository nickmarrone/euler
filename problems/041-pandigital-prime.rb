# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly
# once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?

require '../lib/fixnum'
require 'prime'

def pandigital?(num)
  expected = "123456789"[0...num.num_digits]
  num.to_s.split('').sort.join('') == expected
end

# Get primes < 1 million to speed up
primes = []
Prime.each(10_000_000) { |p| primes << p }.reverse!

primes.each do |n|
  if pandigital?(n)
    puts n
    break
  end
end
