#!/usr/bin/env ruby
require 'pry'

commands = File.readlines("../input.txt", chomp: true)

old_grid = Array.new(1000){Array.new(1000, 0)}
new_grid = Array.new(1000){Array.new(1000, 0)}

commands.each do |command|
  match = command.match(/(.*) (\d{1,3}),(\d{1,3}) through (\d{1,3}),(\d{1,3})/)
  command, x1, y1, x2, y2 = match.captures

  x1 = x1.to_i
  x2 = x2.to_i
  y1 = y1.to_i
  y2 = y2.to_i

  if command == "toggle"
    (y1..y2).each do |y|
      (x1..x2).each do |x|
        new_grid[x][y] += 2

        if old_grid[x][y] == 0
          old_grid[x][y] = 1
        else
          old_grid[x][y] = 0
        end
      end
    end
  elsif command == "turn on"
    (y1..y2).each do |y|
      (x1..x2).each do |x|
        new_grid[x][y] += 1

        old_grid[x][y] = 1
      end
    end
  elsif command == "turn off"
    (y1..y2).each do |y|
      (x1..x2).each do |x|
        new_grid[x][y] -= 1 if new_grid[x][y] > 0

        old_grid[x][y] = 0
      end
    end
  end
end

old_total = 0
new_total = 0

old_grid.each { |x| old_total += x.sum }
new_grid.each { |x| new_total += x.sum }

puts old_total
# 14731887 is too high
# 14393354 is wrong
# 14285376 is wrong
#  1688139 is too low
puts new_total
