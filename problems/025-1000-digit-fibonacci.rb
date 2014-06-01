# What is the first term in the Fibonacci sequence to contain 1000 digits?

require '../lib/fixnum'
require '../lib/fibonacci'

f = FibonacciSequence.new
term = 0
while (next_num = f.next)
  term += 1
  break if next_num.to_s.length == 1000
end

p term
