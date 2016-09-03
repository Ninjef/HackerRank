#!/bin/ruby
def displayPathtoPrincess(n,grid)
  mario_loc = Array.new(1)
  peach_loc = Array.new(1)
  grid.each do |string|
    if string.include?("m")
      mario_loc[1] = string.split("").index("m")
      mario_loc[0] = grid.index(string)
    end
    if string.include?("p")
      peach_loc[1] = string.split("").index("p")
      peach_loc[0] = grid.index(string)
    end
  end

  vertical_moves = mario_loc[0] - peach_loc[0]
  horizontal_moves = mario_loc[1] - peach_loc[1]

  if vertical_moves > 0
    vertical_word = "UP\n"
  elsif vertical_moves < 0
    vertical_word = "DOWN\n"
  end
  if horizontal_moves > 0
    horizontal_word = "LEFT\n"
  elsif horizontal_moves < 0
    horizontal_word = "RIGHT\n"
  end
  puts vertical_word * vertical_moves.abs
  puts horizontal_word * horizontal_moves.abs
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
