# A unit fraction contains 1 in the numerator. Where 1/6 == 0.166666... and has a 1-digit
# recurring cycle. It can be seen that 1/7 = 0.(142857) has a 6-digit recurring cycle. Find the
# value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

def recurring_cycle_length(num, den)
  cycle = []
  den_len = den.to_s.length
  num *= 10

  loop do
    if num < den
      num *= 10
      cycle << 0
    else
      digit = num / den

      # Check for infinite repeat of a single digit
      # but don't be fooled by 1/101 = 0.009900990099...
      if cycle.last(den_len - 1) == digit
        return den_len
      end

      cycle << digit
      num = (num % den) * 10
    end

    # If the next digit is zero, there is no cycle
    return 0 if num == 0

    # Check for repeat by splitting the cycle into 2 and seeing if they equal each other
    # Must also check for case of e.g. 1/14 = 0.0(7142857)
    length = cycle.length
    if length > 1
      (den_len..length/2).each do |n|
        if cycle[-n*2, n] == cycle[-n, n]
          return n
        end
      end
    end
  end

  cycle
end

input_results = [
  [1, 0],
  [2, 0],
  [3, 1],
  [6, 1],
  [7, 6],
  [14, 6],
  [101, 4]
]

input_results.each do |den, result|
  unless recurring_cycle_length(1, den) == result
    p "1/#{den}'s cycle length is #{recurring_cycle_length(1, den)} but should be #{result}"
  end
end

longest = 0
longest_value = 0

(1...1000).each do |d|
  value = recurring_cycle_length(1, d)
  if value >= longest_value
    longest = d
    longest_value = value
  end
end

puts longest

