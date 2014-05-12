# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

require '../lib/fixnum'

# Some tests
input_results = [
  [0, "zero"],
  [-15, "negative fifteen"],
  [7, "seven"],
  [12, "twelve"],
  [25, "twenty five"],
  [100, "one hundred"],
  [356, "three hundred and fifty six"],
  [1000, "one thousand"],
  [7439, "seven thousand four hundred and thirty nine"],
  [45_231, "forty five thousand two hundred and thirty one"],
  [912_000, "nine hundred and twelve thousand"]
]

input_results.each do |input, result|
  unless input.in_words == result
    puts "#{input.in_words} does not equal '#{result}'"
  end
end

puts (1..1000).inject(""){ |result, n| result += n.in_words; result }.gsub(' ', '').length
