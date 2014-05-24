# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)

require '../lib/fixnum'

results = []

(1...1_000_000).each do |num|
  results << num if num.palindrome? && num.binary_palindrome?
end

p results
puts results.inject(&:+)
