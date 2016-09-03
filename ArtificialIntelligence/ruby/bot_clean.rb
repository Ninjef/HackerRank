#!/usr/bin/ruby
require 'pry'
def next_move posr, posc, board
  bot_loc = [posr,posc]
  next_target = closest_target bot_loc, board
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

def closest_target bot_loc, board
  dirt_locs = Array.new
  board.each_with_index do |row_string,vertical_index|
    if row_string.include?("d")
      row_string.split("").each_with_index do |string,horizontal_index|
        if string == "d"
          dirt_locs << [vertical_index, horizontal_index]
        end
      end
    end
  end

  dirt_locs.each { |dirt_loc| dirt_loc << (bot_loc[0] - dirt_loc[0]).abs + (bot_loc[1] - dirt_loc[1]).abs }
  dirt_locs.sort_by!(&:last)
  
  return dirt_locs[0]
end

pos = gets.split.map {|i| i.to_i}
board = Array.new(5)

(0...5).each do |i|
    board[i] = gets.strip
end

puts next_move pos[0], pos[1], board
