require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require './lib/encryptor'
require './lib/decryptor'
require 'digest'
require 'pry'

class Cracker

  attr_reader :input_string,
              :date,
              :length,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset,
              :character_set

  def initialize(input_string,date)
    @input_string = input_string
    @date = date
    @length = input_string.length

    @offsetter = Offsetter.new(@date)
    @a_offset = @offsetter.a_offset
    @b_offset = @offsetter.b_offset
    @c_offset = @offsetter.c_offset
    @d_offset = @offsetter.d_offset

    @character_set = ["a", "b", "c", "d", "e",
                      "f", "g", "h", "i", "j",
                      "k", "l", "m", "n", "o",
                      "p", "q", "r", "s", "t",
                      "u", "v", "w", "x", "y",
                      "z", " "]
  end

  def final_char_index
    @character_set.index(@input_string[-1])
  end

  def second_last_char_index
    @character_set.index(@input_string[-2])
  end

  def final_character_position
    if @length % 4 == 0
      "d"
    elsif @length % 3 == 0
      "c"
    elsif @length % 2 == 0
      "b"
    elsif @length % 1 == 0
      "a"
    end
  end

  def final_four_pattern
    if final_character_position == "d"
      ['a','b','c','d']
    elsif final_character_position == "c"
      ['d','a','b','c']
    elsif final_character_position == "b"
      ['c','d','a','b']
    elsif final_character_position == "a"
      ['b','c','d','a']
    end
  end


end
