# Copyright (c) 2018 Michael R. Cook
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
module SpriteFinder
  class Sprite
    def initialize(width, height, bytes)
      @width = width
      @height = 8
      @sprite = []

      map_sprite(bytes)
    end

    def pixel_rows
      sprite
    end

    private

    attr_reader :width, :height, :sprite

    def map_sprite(bytes)
      col = 1
      tmps = Array.new(height, "")

      bytes.each_slice(height) do |row|
        row.each.with_index do |byte, i|
          tmps[i] += add_pixels(byte)
        end

        if col == width
          col = 1
          tmps.each do |s|
            sprite << s
          end
          tmps.map! { |s| s = "" }
        else
          col += 1
        end
      end
    end

    def add_pixels(byte)
      pixels = ''
      to_bits(byte).each do |b|
        if b == 1
          pixels << '██'
        else
          pixels << '  '
        end
      end
      pixels
    end

    def to_bits(byte)
      pixels = "%08d" % byte.to_s(2)

      row = []
      pixels.each_byte do |px|
          row << px.chr.to_i
      end
      row
    end
  end
end
