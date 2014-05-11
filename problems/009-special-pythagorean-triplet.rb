def is_pythagorean_triplet(a, b, c)
  a**2 + b**2 == c**2
end

permutations = []

(1..333).each do |a|
  ((a+1)..(999-a)).each do |b|
    permutations << [a, b]
  end
end

result = permutations.select { |a, b| is_pythagorean_triplet(a, b, 1000-a-b) }.first
result << 1000 - result.inject(&:+)

puts result.inject(&:*)
