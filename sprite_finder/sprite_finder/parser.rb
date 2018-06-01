# Copyright (c) 2018 Michael R. Cook
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
require_relative 'sprite'


module SpriteFinder
  class Parser
    def initialize(width:, height:, offset:, bytes:, annotate:, upside_down:)
      @width       = width
      @height      = height
      @offset      = offset
      @bytes       = bytes
      @annotate    = annotate
      @upside_down = upside_down

      @sprites = []
    end

    def call
      spritify
    end

    def output
      sprites.reverse! if upside_down

      sprites.each do |sprite|
        sprite.pixel_rows.reverse! if upside_down

        puts sprite.address if annotate
        sprite.pixel_rows.each do |row|
          puts row
        end
      end
    end

    private

    attr_reader :offset, :bytes, :width, :height, :annotate, :upside_down
    attr_reader :sprites

    def spritify
      pixels.each_slice(width*height) do |sprite_bits|
        sprites << Sprite.new(width, height, sprite_bits)
      end
    end

    def pixels
      address = 0
      bits = []

      bytes.each_byte do |byte|
        address += 1
        next if address < offset

        row = to_bits(byte)
        bits += row
      end

      bits
    end

    # Converts a uint8 value to binary, as an array of bits.
    # 1. Convert uint8 to binary, as a string of 1's and 0's.
    # 2. Split binary string into an array.
    # 3. Convert each string to an integer.
    def to_bits(byte)
      ("%08d" % byte.to_s(2)).split('').map { |px| px.chr.to_i }
    end
  end
end
