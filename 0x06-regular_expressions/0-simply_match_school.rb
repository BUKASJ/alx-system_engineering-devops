#!/usr/bin/env ruby

# This Ruby script accepts one argument and passes it to a regular expression matching method

def match_school(input)
  regex = /School/
  if input.match?(regex)
    puts "School"
  else
    puts ""
  end
end


if ARGV.empty?
  putc ""
else
  input = ARGV[0]
  match_school(input)
end
