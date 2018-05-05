# Super simple script for extracting sprites from bytes
# Written in Ruby - tested with Ruby >= v2.3
#
# Copyright (c) 2018 Michael R. Cook
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
# Usage:
# $ ruby sprite_finder.rb > sprites.txt

require 'optparse'
require_relative 'sprite_finder/parser'
require_relative 'sprite_finder/skool_parser'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: sprite_finder.rb [options]"

  opts.on("-a", "--[no-]annotate", "Annotate output with address values") do |v|
    options[:annotate] = v
  end
  opts.on("-f FILE", "Filename for a Z80 file") do |v|
    options[:filename] = v
  end
end.parse!

# Example data block - replace with your own data
data_block = "
b$87F8 DEFB $00,$3C,$66,$66,$7E,$66,$66,$66
 $8800 DEFB $00,$7C,$66,$66,$78,$66,$66,$7C

b34808 DEFB 0,60,102,102,126,102,102,102
 34816 DEFB 0,124,102,102,120,102,102,124
 "

if options[:filename]
  bytes = File.binread(options[:filename])
else
  bytes = SpriteFinder::SkoolParser.new(data_block).get_bytes
end

finder = SpriteFinder::Parser.new(
  width:    8,
  height:   8,
  offset:   0,
  bytes:    bytes,
  annotate: options[:annotate],
)

finder.call
finder.output
