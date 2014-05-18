# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
# 73, 79, and 97.

# How many circular primes are there below one million?

require 'prime'

class CircularPrimes
  def initialize
    @prime_hash = {}
    @circular_primes = []

    Prime.each(1_000_000) do |p|
      @prime_hash[p] = true
    end
  end

  def is_circular_prime?(prime)
    prime_s = prime.to_s
    num_digits = prime_s.length

    num_digits.times do
      return false unless @prime_hash[prime_s.to_i] == true
      prime_s = prime_s.split('').rotate.join('')
    end

    true
  end

  def circular_primes
    return @circular_primes if @circular_primes.length > 0

    @prime_hash.keys.each do |prime|
      @circular_primes << prime if is_circular_prime?(prime)
    end

    @circular_primes
  end
end

c = CircularPrimes.new
p c.circular_primes
p c.circular_primes.count
