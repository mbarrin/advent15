#!/usr/bin/env ruby
lines = File.readlines("../input.txt", chomp: true)

string_count, mem_count, large_count = 0, 0, 0

lines.each do |line|
  string_count += line.size
  mem_count +=  line.undump.size
  large_count += line.dump.size
end

puts string_count - mem_count
puts large_count - string_count
