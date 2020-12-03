#!/usr/bin/env ruby

directions = File.read("../input.txt", chomp: true).chars

x, y = 0, 0
solo = []

directions.each do |santa|
  solo << "#{x},#{y}"

  y += 1 if santa == "^"
  x += 1 if santa == ">"
  y -= 1 if santa == "v"
  x -= 1 if santa == "<"
end

x1, y1, x2, y2 = 0, 0, 0, 0
duo = []

directions.each_slice(2) do |direction|
  duo << "#{x1},#{y1}"
  duo << "#{x2},#{y2}"

  santa = direction.first
  robo = direction.last

  y1 += 1 if santa == "^"
  x1 += 1 if santa == ">"
  y1 -= 1 if santa == "v"
  x1 -= 1 if santa == "<"

  y2 += 1 if robo == "^"
  x2 += 1 if robo == ">"
  y2 -= 1 if robo == "v"
  x2 -= 1 if robo == "<"
end

puts solo.uniq.count
puts duo.uniq.count
