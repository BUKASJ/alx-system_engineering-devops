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
