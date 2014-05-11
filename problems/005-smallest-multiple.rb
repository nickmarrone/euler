def divisible_through_20(num)
  (2..20).all?{ |d| num % d == 0 }
end

factors = [2, 2, 2, 2, 3, 3, 5, 7, 11, 13, 17, 19]
possible = factors.inject(&:*)
divisible_through_20(possible)

puts possible
