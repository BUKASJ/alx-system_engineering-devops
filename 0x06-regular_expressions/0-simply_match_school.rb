#!/usr/bin/env ruby

regex = /School/
if ARGV[0] =~ regex
  puts "String contains 'School'"
else
  puts "String does not contain 'School'"
end
