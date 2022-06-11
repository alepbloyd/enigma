require 'key_generator'
require 'date_generator'
require 'a_b_c_d_keysetter'
require 'offsetter'
require 'enigma'
require 'digest'

class Encryptor

  attr_reader :input_message,
              :code_key,
              :date,
              :abcd_gen,
              :a_key,
              :b_key,
              :c_key,
              :d_key,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset,
              :a_shift,
              :b_shift,
              :c_shift,
              :d_shift,
              :character_set

  def initialize(input_message,code_key = nil,date = nil)
    @input_message = input_message

    @key_gen = KeyGenerator.new(code_key)
    @code_key = @key_gen.code_key

    @date_gen = DateGenerator.new(date)
    @date = @date_gen.date

    @abcd_gen = ABCDKeySetter.new(@code_key)
    @a_key = @abcd_gen.a_key
    @b_key = @abcd_gen.b_key
    @c_key = @abcd_gen.c_key
    @d_key = @abcd_gen.d_key

    @offsetter = Offsetter.new(@date)
    @a_offset = @offsetter.a_offset
    @b_offset = @offsetter.b_offset
    @c_offset = @offsetter.c_offset
    @d_offset = @offsetter.d_offset

    @a_shift = @a_key.to_i + @a_offset.to_i
    @b_shift = @b_key.to_i + @b_offset.to_i
    @c_shift = @c_key.to_i + @c_offset.to_i
    @d_shift = @d_key.to_i + @d_offset.to_i

    @character_set = ["a", "b", "c", "d", "e",
                      "f", "g", "h", "i", "j",
                      "k", "l", "m", "n", "o",
                      "p", "q", "r", "s", "t",
                      "u", "v", "w", "x", "y",
                      "z", " "]
  end

  def shift_character(start_character,shift_amount)
    index = @character_set.index(start_character)
    return_index = index + shift_amount
    if return_index > 27
      @character_set[return_index % 27]
    else
      return @character_set[return_index]
    end
  end

  def input_array
    @input_message.chars
  end

end
