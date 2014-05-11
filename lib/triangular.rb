# A triangular number is a number created from the sequence of real numbers.
# e.g. 28 is the sum of 1 + 2 + ... + 7, so it is the 7th triangular number.

class TriangularSequence
  def initialize
    @current = 1
    @sum = 0
  end

  def next
    @current += 1
    @sum += @current

    @sum
  end
end
