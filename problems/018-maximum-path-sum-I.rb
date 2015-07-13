triangle = [
[75],
[95, 64],
[17, 47, 82],
[18, 35, 87, 10],
[20, 4, 82, 47, 65],
[19, 1, 23, 75, 3, 34],
[88, 2, 77, 73, 7, 63, 67],
[99, 65, 4, 28, 6, 16, 70, 92],
[41, 41, 26, 56, 83, 40, 80, 70, 33],
[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
[63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
[4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
]

class BinaryTreeNode
  attr_accessor :value, :sum, :parent, :left, :right

  def initialize(value, parent = nil)
    self.value = value
    self.parent = parent
    self.sum = parent.nil? ? value : value + parent.sum
  end

  # def add_parent_as_left(value)
  #   parent = BinaryTreeNode.new(value)
  #   parent.left = self
  #   add_to_sum(value)
  # end

  # def add_parent_as_right(value)
  #   parent = BinaryTreeNode.new(value)
  #   parent.right = self
  #   add_to_sum(value)
  # end

  def add_left(node)
    puts "this shouldn't be null" if node.nil?
    self.left = node
    left.add_to_sum(value)
  end

  def add_right(node)
    puts "this shouldn't be null" if node.nil?
    self.right = node
    right.add_to_sum(value)
  end

  # Method cascades down to children
  def add_to_sum(value)
    self.sum += value
    left.add_to_sum(value) if left
    right.add_to_sum(value) if right
  end
end

# Build up a binary tree with the sums at each node

head = BinaryTreeNode.new(triangle.slice!(0).first)
previous_row_nodes = [head]

triangle.each do |row|
  previous_row_nodes.each_with_index do |node, index|
    node.left = BinaryTreeNode.new(row[index])
    node.right = BinaryTreeNode.new(row[index+1])
  end

  current_row_nodes = row.map{ |value| BinaryTreeNode.new(value) }

  unless previous_row_nodes.length == 0

    current_row_nodes.each_with_index do |node, index|
      node.add_left(previous_row_nodes[index])
      node.add_right(previous_row_nodes[index+1])
    end
  end

  if row.length == 1
    head = current_row_nodes.first
    break
  end

  previous_row_nodes = current_row_nodes
end

# Find the node with the greatest sum... wait that won't totally work. Hmmm....
puts head.value
