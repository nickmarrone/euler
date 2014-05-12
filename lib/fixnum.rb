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

  def palindrome?
    self.to_s == self.to_s.reverse
  end

  # Get array of factors of this number
  #
  # @return factors [Array] of [Fixnum]
  def factors
    results = []
    total = 1

    Prime.each(self) do |prime|
      if self % prime == 0
        results << prime
        total *= prime
        break if total == self
      end
    end

    results
  end

  def factors2
    results = []
    remaining = self

    Prime.each(self) do |prime|
      if self % prime == 0
        results << prime
        remaining /= prime
        break if remaining == 1
      end
    end

    results
  end

  # How many divisors does this number have?
  # Equation: If factors are a^x * b^y * c^z .... = n, then number of divisors is (x+1) * (y+1) * (z+1) ...
  #
  # @return [Fixnum]
  def number_of_divisors
    group = self.factors.group_numbers
    group.values.map{|v| v += 1}.inject(&:*)
  end

  # Get array of all numbers that divide evenly into this number
  #
  # @return divisors [Array] of [Fixnum]
  def divisors
    results = []

    (1..(self/2)).each do |n|
      results << n if self % n == 0
    end

    results
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
end
