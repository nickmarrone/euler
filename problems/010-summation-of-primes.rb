# Find the sum of all primes below 2 million

require 'prime'

sum = 0

Prime.each do |prime|
  break unless prime < 2_000_000

  sum += prime
end

puts sum
