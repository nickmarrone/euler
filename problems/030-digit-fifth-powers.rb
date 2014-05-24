# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

def sum_of_fifth_power_of_digits(num)
  arr = num.to_s.split('').map(&:to_i)
  arr.inject(0){ |sum, n| sum += n ** 5; sum }
end

# Largest 5th power is 9, and 9**5 = 59049
# Therefore, I only have to check until the number of digits outstrips our ability to do it

# n = [9, 99, 999, 9999, 99_999, 999_999, 9_999_999, 99_999_999, 999_999_999, 9_999_999_999, 99_999_999_999, 999_999_999_999]
# n.each do |nine|
#   s = sum_of_fifth_power_of_digits(nine)
#   p "#{nine} => #{s} => #{nine - s}"
# end

# So I only need to go up to 999_999

results = []
(2..999_999).each do |num|
  results << num if num == sum_of_fifth_power_of_digits(num)
end

p results
p "sum: #{results.inject(&:+)}"