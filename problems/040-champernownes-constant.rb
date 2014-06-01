# An irrational decimal fraction is created by concatenating the positive integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of the following expression.

# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

max_digits = 1_000_000

# c represents the decimal portion of Champernowne's constant
c = "."

a = 1
while c.length <= 1_000_000
  c << a.to_s
  a += 1
end

result = c[1].to_i * c[10].to_i * c[100].to_i * c[1000].to_i * c[10_000].to_i * c[100_000].to_i * c[1_000_000].to_i
puts result
