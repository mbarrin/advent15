#!/usr/bin/env ruby

words = File.readlines("../input.txt", chomp: true)

nice_1 = []
nice_2 = []

def bad_pair?(word)
  return true if word.include?("ab") ||
    word.include?("cd") ||
    word.include?("pq") ||
    word.include?("xy")
  false
end

def double?(word)
  word.chars.each_with_index do |_, index|
    return true if word[index] == word[index+1]
  end

  false
end

def vowels?(word)
  count = 0
  vowels = %w[a e i o u]
  word.chars.each do |letter|
    count += 1 if vowels.include?(letter)
  end

  count >= 3
end

def pair?(word)
  pair = {}
  word.chars.each_with_index do |_, index|
    next if word[index] == word[index+2] &&
      word[index] == word[index+3]

    key = "#{word[index]}#{word[index+1]}"

    if pair.key?(key)
      pair[key] += 1
    else
      pair[key] = 1
    end
  end

  pair.values.each do |num|
    return true if num >= 2
  end

  false
end

def between?(word)
  word.chars.each_with_index do |_, index|
    return true if word[index] == word[index+2]
  end

  false
end

words.each do |word|
  next if bad_pair?(word)
  next unless double?(word)
  next unless vowels?(word)

  nice_1 << word
end

words.each do |word|
  next unless between?(word)
  next unless pair?(word)

  nice_2 << word
end

puts nice_1.count
puts nice_2.count
