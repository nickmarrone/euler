# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
# attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
# correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less
# than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms,
# find the value of the denominator.

require '../lib/fixnum'

# Return the result of num/den if they have common digits, otherwise nil
def strip_common_digits(num, den)
  # Rejct the trivial examples
  return nil, nil if num % 10 == 0 || den % 10 == 0

  a = num.to_s.split('').sort
  b = den.to_s.split('').sort

  # Case of 49/94 is a no go
  return nil, nil if a == b

  common = a & b
  unless common.length == 0
    a.reject!{|x| x == common.first}
    b.reject!{|x| x == common.first}

    # Case that one of the numbers is like 99 and both values were rejected
    return nil, nil if a.length == 0 || b.length == 0

    return a.first.to_f, b.first.to_f
  end
end

results = []

(11..98).each do |num|
  ((num+1)..99).each do |den|
    a, b = strip_common_digits(num, den)
    if a && a/b == num.to_f/den.to_f
      results << [a, b]
    end
  end
end

top = results.inject(1){|sum, n| sum *= n[0]; sum}.to_i
bottom = results.inject(1){|sum, n| sum *= n[1]; sum}.to_i

a, b = Fixnum.simplify_fraction(top, bottom)
p "Result: #{a}/#{b}"
