#!/usr/bin/env ruby

require 'geo_pattern'

if ARGV.count == 0
  puts "What string would you like to patternify?"
  seed = gets.chomp
else
  seed = ARGV[0]
end

file_name = "#{seed}.svg"
File.write("images/#{file_name}", GeoPattern.generate(seed))
puts "SVG written to images/#{file_name}"

png_name = "#{seed}.png"

if system("convert images/#{file_name} images/#{png_name}")
  puts "PNG written to images/#{png_name}"
  `open images/#{png_name}`
end
