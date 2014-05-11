# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner. How many such routes are there through a 20×20 grid?

grid = [[0, 1],
        [1, 2]]

def grow_lattice_grid(grid)

  # Increase the size of the matrix by one
  grid.each{ |row| row << nil }
  width = grid[0].length

  grid << Array.new(width){|i| nil}
  height = grid.length

  # Set the upper right and bottom left corners
  grid[0][width-1] = 1
  grid[height-1][0] = 1

  # Fill in any points that are not yet set
  grid.each_with_index do |row, y_index|
    row.each_with_index do |value, x_index|
      if value.nil?
        # Each square equals the sum of the squares above and to the left of it
        grid[y_index][x_index] = grid[y_index-1][x_index] + grid[y_index][x_index-1]
      end
    end
  end
end

19.times{ grow_lattice_grid(grid) }

puts grid[20][20]
