require 'prime'

class Fixnum
  WORDS = {
    "1" => "one",
    "2" => "two",
    "3" => "three",
    "4" => "four",
    "5" => "five",
    "6" => "six",
    "7" => "seven",
    "8" => "eight",
    "9" => "nine",
    "10" => "ten",
    "11" => "eleven",
    "12" => "twelve",
    "13" => "thirteen",
    "14" => "fourteen",
    "15" => "fifteen",
    "16" => "sixteen",
    "17" => "seventeen",
    "18" => "eighteen",
    "19" => "nineteen",
    "20" => "twenty",
    "30" => "thirty",
    "40" => "forty",
    "50" => "fifty",
    "60" => "sixty",
    "70" => "seventy",
    "80" => "eighty",
    "90" => "ninety"
  }

  def even?
    self % 2 == 0
  end

  def odd?
    self % 2 == 1
  end

  def num_digits
    self.to_s.length
  end

  def palindrome?
    num = self.to_s
    num == num.reverse
  end

  def binary_palindrome?
    binary = self.to_s(2)
    binary == binary.reverse
  end

  def factorial
    @factorial_hash ||= {0 => 1, 1 => 1}
    @factorial_hash[self] || @factorial_hash[self] = (self-1).factorial * self
  end

  def to_a
    self.to_s.split('').map(&:to_i)
  end

  # Get prime factors of this number
  #
  # @return {Array} of {Fixnum}
  def prime_factors
    results = []
    self.prime_division.each do |num, power|
      power.times { results << num }
    end

    results
  end

  # Get all divisors of this number (including itself)
  #
  # @return {Array} of {Fixnum}
  def divisors
    primes, powers = self.prime_division.transpose
    exponents = powers.map{|i| (0..i).to_a}

    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
    end

    divisors.sort
  end

  # Get all proper divisors of this number (does not include itself)
  # @return {Array} of {Fixnum}
  def proper_divisors
    all_divisors = divisors
    all_divisors.delete(self)
    all_divisors
  end

  # How many divisors does this number have?
  # Equation: If factors are a^x * b^y * c^z .... = n, then number of divisors is (x+1) * (y+1) * (z+1) ...
  #
  # @return [Fixnum]
  def number_of_divisors
    return 1 if self == 1
    self.prime_division.map{|num, power| power + 1 }.inject(&:*)
  end

  # Return 0 for a perfect number, 1 for an abundant number and -1 for a deficient number
  #
  # @returns {Fixnum}
  def perfect_number_comparison
    self.proper_divisors.inject(&:+) <=> self
  end

  # A perfect number is one where the sum of its proper divisors equals itself
  #
  # @returns {Boolean}
  def perfect?
    self.proper_divisors.inject(&:+) == self
  end

  # A deficient number is one where the sum of its proper divisors is less than itself
  #
  # @returns {Boolean}
  def deficient?
    self.proper_divisors.inject(&:+) < self
  end

  # An abundant number is one where the sum of its proper divisors is greater than itself
  #
  # @returns {Boolean}
  def abundant?
    self.proper_divisors.inject(&:+) > self
  end

  # Defined as n -> n/2 if even, n -> 3n+1 if odd until n == 1
  def collatz_sequence
    n = self
    results = []

    until n == 1
      results << n
      n = n.even? ? n / 2 : n * 3 + 1
    end

    results
  end

  # Defined as 1^2 + 2^2 + ... + 10^2 = 385
  def sum_of_the_squares
    sum = 0
    (1..self).each do |n|
      sum += n**2
    end
    sum
  end

  # Defined as (1 + 2 + ... + 10)^2 = 3025
  def square_of_the_sum
    (1..self).inject(&:+)**2
  end

  #Simplify a fraction from, e.g. 7/21 => 1/3
  def self.simplify_fraction(num, den)
    pass_without_division = true

    while true
      return num, den unless pass_without_division

      pass_without_division = true
      (2..num).each do |x|
        if num % x == 0 && den % x == 0
          num = num / x
          den = den / x
          pass_without_division = false
        end
      end
    end
  end

  def in_words
    return "zero" if self == 0
    return "negative " + in_words_helper(self*-1) if self < 0

    in_words_helper(self)
  end

  private

  def in_words_helper(number)
    num_s = number.to_s
    if number <= 20
      WORDS[num_s]
    elsif number < 100
      key = num_s[0] + '0'
      remainder = number % 10
      result = WORDS[key]
      result += " #{remainder.in_words}" unless remainder == 0
      result
    elsif number < 1000
      result = WORDS[num_s[0]] + ' hundred'
      remainder = number % 100
      result += " and #{remainder.in_words}" unless remainder == 0
      result
    elsif number < 1_000_000
      first_half = number / 1000
      remainder = number % 1000
      result = "#{first_half.in_words} thousand"
      result += " #{remainder.in_words}" unless remainder == 0
      result
    end
  end

end

class Array
  # Given an array of numbers, group them in a cash with the count of each number
  # e.g. [1, 1, 2, 3, 4, 4, 4] => {1=>2, 2=>1, 3=>1, 4=>3}
  def group_numbers
    h = Hash.new{ |hash, key| hash[key] = 0 }
    self.inject(h){ |hash, n| hash[n] += 1; hash }
  end

  def sum
    self.inject(&:+)
  end

  def product
    self.inject(&:*)
  end
end
