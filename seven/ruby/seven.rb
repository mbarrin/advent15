#!/usr/bin/env ruby

@lookup_table = {
  "AND" => "&",
  "OR" => "|",
  "LSHIFT" => "<<",
  "RSHIFT" => ">>",
  "NOT" => "~"
}

def solve(circuit, key)
  foo = circuit[key]

  return foo if foo.is_a? Integer

  if foo.size == 3
    circuit[key][0] = solve(circuit, foo[0]) unless foo[0].is_a? Integer
  end
  circuit[key][-1] = solve(circuit, foo[-1]) unless foo[-1].is_a? Integer

  eval(circuit[key].join(" ").gsub(/[A-Z]+/, @lookup_table))
end

def build_circuit(lines)
  circuit = {}

  lines.each do |line|
    input, output = line.split(" -> ")

    input = input.split

    input.each_with_index do |_, index|
      input[index] = input[index].to_i if input[index].match?(/\d+/)
    end

    circuit[output] = input
  end

  circuit
end

def main
  lines = File.readlines("../input.txt", chomp: true)

  circuit_one = build_circuit(lines)
  circuit_two = build_circuit(lines)

  part_one = solve(circuit_one, "a")

  puts part_one

  circuit_two["b"] = part_one

  puts solve(circuit_two, "a")
end

main
