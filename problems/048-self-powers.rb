# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

def sum_of_self_powers(num)
  (1..num).inject(0){ |sum, n| sum += n**n; sum }
end

expected = 10405071317
result = sum_of_self_powers(10)
unless expected == result
  p "Result incorrect: #{result}"
end

answer = sum_of_self_powers(1000)
puts answer.to_s[-10, 10]
