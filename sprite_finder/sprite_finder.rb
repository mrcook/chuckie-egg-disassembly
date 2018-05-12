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
b$90D0 DEFB $00,$00,$00,$00,$00,$00,$00,$00
 $90D8 DEFB $00,$00,$00,$00,$70,$00,$58,$1E
 $90E0 DEFB $27,$FF,$51,$FF,$00,$7F,$10,$3E
 $90E8 DEFB $28,$08,$54,$08,$AA,$08,$00,$18
 $90F0 DEFB $00,$00,$00,$00,$00,$00,$00,$00
 $90F8 DEFB $00,$00,$00,$00,$00,$0E,$78,$1A
 $9100 DEFB $FF,$E4,$FF,$8A,$FE,$00,$7C,$08
 $9108 DEFB $10,$14,$10,$2A,$10,$55,$18,$00
 $9110 DEFB $00,$00,$00,$00,$00,$00,$0C,$00
 $9118 DEFB $0F,$00,$0F,$80,$1F,$C0
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
