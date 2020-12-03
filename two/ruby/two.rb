#!/usr/bin/env ruby

input = File.readlines("../input.txt", chomp: true)

paper = 0
ribbon = 0

input.each do |line|
  l,w,h = line.split('x').map(&:to_i)

  sides = [l*w, w*h, l*h]

  measurements = [l,w,h]

  smallest = measurements.sort[0..1]

  ribbon += (smallest.sum * 2) + measurements.inject(:*)

  paper += 2 * sides.sum + sides.min
end

puts paper
puts ribbon
