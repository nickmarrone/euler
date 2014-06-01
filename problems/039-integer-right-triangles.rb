# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are
# exactly three solutions for p = 120.

# {20,48,52}, 24,45,51}, 30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

def solution?(a, b, p)
  x = 2*p*(a + b) - 2*a*b - p*p
  x == 0
end

p_with_most_solutions = 0
most_solutions = 0

(1..1000).each do |p|
  solutions = []
  half_p = p/2

  (1..half_p).each do |a|
    (1..(p-a)).each do |b|
      solutions << [a, b, p] if solution?(a, b, p)
    end
  end

  if solutions.length > most_solutions
    p_with_most_solutions = p
    most_solutions = solutions.length
  end
end

puts p_with_most_solutions
