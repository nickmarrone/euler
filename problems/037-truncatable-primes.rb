# The number 3797 has an interesting property. Being prime itself, it is possible to continuously
# remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we
# can work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to right and right to
# left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'prime'

# Get primes < 1 million to speed up
primes = {}
Prime.each(1_000_000) { |p| primes[p] = true }

def truncatable_prime?(num, primes)
  # It is prime
  return false unless primes[num]

  # It is left truncatable
  temp = num.to_s
  loop do
    temp.slice!(0)
    break if temp.length == 0

    return false unless primes[temp.to_i]
  end

  # It is right truncatable
  temp = num.to_s
  loop do
    temp.slice!(temp.length-1)
    break if temp.length == 0

    return false unless primes[temp.to_i]
  end

  true
end

results = []
a = 10
loop do
  a += 1
  results << a if truncatable_prime?(a, primes)

  break if results.length >= 11
end

puts results.inject(&:+)
