#!/usr/bin/env ruby:

input = File.read("../input.txt", chomp: true)

floor = 0
first_negative = nil

input.chars.each_with_index do |command, i|
  first_negative = i if floor == -1 && first_negative.nil?

  floor += 1 if command == "("
  floor -= 1 if command == ")"
end

puts floor
puts first_negative
