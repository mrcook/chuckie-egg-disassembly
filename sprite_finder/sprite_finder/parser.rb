# Copyright (c) 2018 Michael R. Cook
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
require_relative 'sprite'

module SpriteFinder
  class Parser
    def initialize(width:, height:, offset:, bytes:, annotate:)
      @width    = width / 8 # a single byte is 8x1 pixels
      @height   = height
      @offset   = offset
      @bytes    = bytes
      @annotate = annotate

      @sprites = []
    end

    def call
      spritify
    end

    def output
      sprites.each do |sprite|
        puts sprite.address if annotate
        sprite.pixel_rows.each do |row|
          puts row
        end
        puts
      end
    end

    private

    attr_reader :offset, :bytes, :width, :height, :annotate
    attr_reader :sprites

    def spritify
      index = 0
      address = 0
      sprite_bytes = []

      bytes.each_byte do |byte|
        address += 1
        next if address < offset

        sprite_bytes << byte
        index += 1

        if index >= width * height
          sprites << Sprite.new(width, height, sprite_bytes)
          index = 0
          sprite_bytes = []
        end
      end

      # capture any final half-complete sprite
      sprites << Sprite.new(width, height, sprite_bytes) unless sprite_bytes.empty?
    end
  end
end
