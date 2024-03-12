#!/usr/bin/env ruby

# This Ruby script accepts one argument and passes it to a regular expression matching method

def match_expression(input)
  regex = hb+tn
  if input.match?(regex)
    puts "Match found: #{input}"
  else
    puts "Match not found: #{input}"
  end
end

# Check if an argument is provided
if ARGV.empty?
  putc ""
else
  input = ARGV[0]
  match_expression(input)
end
