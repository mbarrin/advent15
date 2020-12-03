#!/usr/bin/env ruby
require 'digest'

input = "ckczppom"

number = 0
answer5 = nil
answer6 = nil

while true
  hash =  Digest::MD5.hexdigest("#{input}#{number}")

  answer5 = number if hash.match(/^0{5}/)
  number += 1

  break if !answer5.nil?
end

while true
  hash =  Digest::MD5.hexdigest("#{input}#{number}")

  answer6 = number if hash.match(/^0{6}/)
  number += 1

  break if !answer6.nil?
end

puts answer5
puts answer6
