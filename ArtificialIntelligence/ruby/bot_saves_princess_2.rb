#!/bin/ruby
def nextMove(n,r,c,grid)
  mario_loc = [r,c]
  peach_loc = Array.new(1)
  grid.each do |string|
    if string.include?("p")
      peach_loc[1] = string.split("").index("p")
      peach_loc[0] = grid.index(string)
    end
  end

  vertical_moves = mario_loc[0] - peach_loc[0]
  horizontal_moves = mario_loc[1] - peach_loc[1]

  if vertical_moves != 0
    if vertical_moves > 0
      puts "UP"
    else
      puts "DOWN"
    end
  elsif horizontal_moves != 0
    if horizontal_moves > 0
      puts "LEFT"
    else
      puts "RIGHT"
    end
  end
end
n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
