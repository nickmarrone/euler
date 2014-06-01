# Euler discovered the remarkable quadratic formula:

# n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive values
# n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible
# by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes
# for the consecutive values n = 0 to 79. The product of the coefficients, −79 and
# 1601, is −126479.

# Considering quadratics of the form:

# n² + an + b, where |a| < 1000 and |b| < 1000

# where |n| is the modulus/absolute value of n e.g. |11| = 11 and |−4| = 4 Find
# the product of the coefficients, a and b, for the quadratic expression that
# produces the maximum number of primes for consecutive values of n, starting with
# n = 0.

require 'prime'

# Get primes < 1 million to speed up
primes = {}
Prime.each(2_000_000) { |p| primes[p] = true }

# Only solutions where b is prime can be prime when n == 0
temp_b_primes = []
Prime.each(1000) { |p| temp_b_primes << p }
b_primes = temp_b_primes.reverse.map{|x| -x}
b_primes.concat(temp_b_primes)


def quadratic_formula(n, a, b)
  n**2 + a*n + b
end

longest_num = [-1000, b_primes.first]
longest_length = 1

(-1000..1000).each do |a|
  b_primes.each do |b|
    n = 0
    loop do
      next_result = quadratic_formula(n, a, b)
      if n > longest_length
        longest_num = [a, b]
        longest_length = n
      end

      n += 1
      break unless primes[next_result]
    end
  end
end

a = longest_num[0]
b = longest_num[1]
puts a * b
