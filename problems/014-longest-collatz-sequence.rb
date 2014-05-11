# Which starting number, under one million, produces the longest collatz chain?

require '../lib/fixnum'

sequence_length = Hash.new { |hash, key| hash[key] = [] }

(1..1_000_000).each do |n|
  len = n.collatz_sequence.length
  sequence_length[len] << n
end

longest = sequence_length.keys.max
puts sequence_length[longest]
