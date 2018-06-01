# Copyright (c) 2018 Michael R. Cook
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
module SpriteFinder
  class Sprite
    def initialize(width, height, pixels)
      @chr_width = 2
      @sprite = Array.new(height, '')

      map_sprite(width, pixels)
    end

    def pixel_rows
      sprite
    end

    private

    attr_reader :sprite, :chr_width

    def map_sprite(width, pixels)
      pixels.each_slice(width).with_index do |line, index|
        line.each do |pixel|
          sprite[index] += to_chr(pixel)
        end
      end
    end

    def to_chr(pixel)
      pixel == 1 ? '█' * chr_width : ' ' * chr_width
    end
  end
end
