#!/usr/bin/ruby
require 'pry'

def next_move posr, posc, dim1, dim2, board
  bot_loc = [posr,posc]
  dirt_locs = find_dirt_locs board
  next_target = find_next_target bot_loc, dirt_locs
  output_next_move bot_loc, next_target
end

def output_next_move bot_loc, next_target
  puts bot_loc[1] > next_target[1] ? "LEFT" :
       bot_loc[1] < next_target[1] ? "RIGHT" :
       bot_loc[0] > next_target[0] ? "UP" :
       bot_loc[0] < next_target[0] ? "DOWN" :
                                     "CLEAN"
end

def find_dirt_locs board
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
  return dirt_locs
end

def find_next_target loc, dirt_locs
  dirt_locs.each do |dirt_loc|
    dirt_loc << (loc[0] - dirt_loc[0]).abs + (loc[1] - dirt_loc[1]).abs
  end

  dirt_locs.sort_by!(&:last)

  min_distance = dirt_locs[0][2]
  closest_dirt_locs = dirt_locs.clone

  closest_dirt_locs.delete_if do |closest_dirt_loc|
    closest_dirt_loc[2] != min_distance
  end

  if closest_dirt_locs.length > 1
    closest_dirt_locs.each { |closest_dirt_loc| closest_dirt_loc[3] = 0 }
    dirt_locs.each do |dirt_loc|
      closest_dirt_locs.each do |closest_dirt_loc|
        closest_dirt_loc[3] += (dirt_loc[0] - closest_dirt_loc[0]).abs + (dirt_loc[1] - closest_dirt_loc[1]).abs
      end
    end
  end

  closest_dirt_locs.sort_by!(&:last).reverse!

  return closest_dirt_locs[0]
end

pos = gets.split.map {|i| i.to_i}
dim = gets.split.map {|i| i.to_i}
board = Array.new(dim[0])

(0...dim[0]).each do |i|
    board[i] = gets.strip
end

puts next_move pos[0], pos[1], dim[0], dim[1], board

