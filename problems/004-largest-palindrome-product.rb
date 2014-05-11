require '../lib/fixnum'

largest_palindromic_sum = 1

(-999..-1).each do |x|
  ((x+1)..-1).each do |y|
    sum = x * y
    largest_palindromic_sum = sum if sum.palindrome? && sum > largest_palindromic_sum
  end
end

puts largest_palindromic_sum
