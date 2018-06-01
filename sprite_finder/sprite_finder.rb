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
  opts.on("-u", "--[no-]upside_down", "Sprites are upside down") do |v|
    options[:upside_down] = v
  end
  opts.on("-f FILE", "Filename for a Z80 file") do |v|
    options[:filename] = v
  end
end.parse!

# Example data block - replace with your own data
data_block = "
 $8E10 DEFB $00,$00,$03,$80,$03,$C0,$03,$C0
 $8E18 DEFB $3F,$FC,$03,$40,$03,$C0,$01,$80
 $8E20 DEFB $03,$E0,$06,$F0,$05,$F0,$05,$E0
 $8E28 DEFB $03,$C0,$04,$50,$02,$20,$00,$00

b$90B0 DEFB $00,$D0,$00,$A0,$00,$D0,$00,$40
 $90B8 DEFB $00,$20,$00,$20,$00,$30,$07,$30
 $90C0 DEFB $0F,$F0,$0F,$F0,$0F,$E0,$07,$C0
 $90C8 DEFB $01,$80,$02,$50,$04,$20,$02,$00
"

if options[:filename]
  bytes = File.binread(options[:filename])
else
  bytes = SpriteFinder::SkoolParser.new(data_block).get_bytes
end

finder = SpriteFinder::Parser.new(
  width:    16,
  height:   16,
  offset:   0,
  bytes:    bytes,
  annotate: options[:annotate],
  upside_down: options[:upside_down],
)

finder.call
finder.output
