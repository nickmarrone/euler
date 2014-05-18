# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

# It is possible to make £2 in the following way:
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

# How many different ways can £2 be made using any number of coins?

coins = [200, 100, 50, 20, 10, 5, 2, 1]

class Node
  attr_accessor :value, :sum, :children

  def initialize(value, parent_sum)
    self.value = value
    self.sum = parent_sum + value
    self.children = []
  end
end

head = Node.new(0, 0)
queue = [head]

while !queue.empty?
  n = queue.shift

  unless n.sum >= 200
    coins.each do |coin|
      if n.value == 0 || coin <= n.value
        c = Node.new(coin, n.sum)
        n.children << c
        queue << c
      end
    end
  end
end

def number_of_200_pence_combos(node)
  total = 0

  total += 1 if node.sum == 200

  node.children.each do |child|
    total += number_of_200_pence_combos(child)
  end

  total
end

p number_of_200_pence_combos(head)
