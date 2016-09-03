#!/usr/bin/ruby
def nextMove posr, posc, board
  bot_loc = [posr,posc]
  next_target = dirt_location bot_loc, board
  output_next_move bot_loc, next_target
end

def output_next_move bot_loc, next_target
  vertical_moves = bot_loc[0] - next_target[0]
  horizontal_moves = bot_loc[1] - next_target[1]

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
  else
    puts "CLEAN"
  end
end

def dirt_location bot_loc, board
  dirt_loc = Array.new
  board.each_with_index do |row_string,vertical_index|
    if row_string.include?("d")
      dirt_loc[1] = row_string.split("").index("d")
      dirt_loc[0] = vertical_index
    end
  end

  return dirt_loc
end
pos = gets.split.map {|i| i.to_i}
board = Array.new(5)

(0...5).each do |i|
    board[i] = gets.strip
end

puts nextMove pos[0], pos[1], board
