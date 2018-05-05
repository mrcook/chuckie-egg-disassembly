# Copyright (c) 2018 Michael R. Cook
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
module SpriteFinder
  class SkoolParser
    def initialize(str)
      d = strip_non_bytes(str)
      @data = convert_to_chars(d)
    end

    def get_bytes
      data
    end

    private

    attr_accessor :data

    # remove the skoolkit bits: `b16384 DEFB`
    def strip_non_bytes(str)
      str.chomp.strip.split("\n").collect! do |l|
        l.chomp.sub(/\A[$a-zA-Z0-9 ]+ DEF[BW] (.+)\z/, '\1,')
      end
    end

    # convert the hex/decimal values to characters
    def convert_to_chars(data_array)
      bytes = []
      data_array.delete_if{|x| x.empty?}.join.split(',').each do |b|
        if b.match(/\$/)
          bytes << b.gsub(/\$/, '').hex.chr
        else
          bytes << b.to_i.chr
        end
      end
      bytes.join
    end
  end
end
