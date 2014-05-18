# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.

require 'set'

def arrayify_digits(a, b, c)
  arr = []
  arr.concat(a.to_s.split(''))
  arr.concat(b.to_s.split(''))
  arr.concat(c.to_s.split(''))

  arr
end

def is_pandigital?(arr)
  arr.sort.join('') == '123456789'
end

products = Set.new

# Stop at 100 because 100 * 100 = 10000 is too many digits for a 1-0 pandigital
(1...100).each do |a|
  b = a
  loop do
    c = a * b
    arr = arrayify_digits(a, b, c)
    products << c if is_pandigital?(arr)
    b += 1
    break if arr.count > 9
  end
end

p products.inject(&:+)
