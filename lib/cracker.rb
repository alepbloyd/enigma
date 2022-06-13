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

  def third_last_char_index
    @character_set.index(@input_string[-3])
  end

  def fourth_last_char_index
    @character_set.index(@input_string[-4])
  end

  def final_char_diff
    (final_char_index - @character_set.index("d")).abs
  end

  def second_last_char_diff
    (second_last_char_index - @character_set.index("n")).abs
  end

  def third_last_char_diff
    (third_last_char_index - @character_set.index("e")).abs
  end

  def fourth_last_char_diff
    (fourth_last_char_index - @character_set.index(" ")).abs
  end

  def a_key_initial
    if final_four_pattern.index('a') + 1 == 1
      "%02d" % (fourth_last_char_diff - @a_offset).to_i
    elsif final_four_pattern.index('a') + 1 == 2
      "%02d" % (third_last_char_diff - @a_offset).to_i
    elsif final_four_pattern.index('a') + 1 == 3
      "%02d" % (second_last_char_diff - @a_offset).to_i
    elsif final_four_pattern.index('a') + 1 == 4
      "%02d" % (final_char_diff - @a_offset).to_i
    end
  end

  def a_key_options
    return_array = [a_key_initial]
    i = a_key_initial.to_i
    until i > 73 do
      i += 27
      return_array << ("%02d" % i)
    end
    return_array
  end

  def b_key
    if final_four_pattern.index('b') + 1 == 1
      "%02d" % (fourth_last_char_diff - @b_offset).to_i
    elsif final_four_pattern.index('b') + 1 == 2
      "%02d" % (third_last_char_diff - @a_offset).to_i
    elsif final_four_pattern.index('b') + 1 == 3
      "%02d" % (second_last_char_diff - @b_offset).to_i
    elsif final_four_pattern.index('b') + 1 == 4
      "%02d" % (final_char_diff - @b_offset).to_i
    end
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
