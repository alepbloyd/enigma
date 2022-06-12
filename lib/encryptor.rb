require 'digest'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require './lib/offsetter'

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

  def encrypt
    return_array = []
    return_hash = {}

    input_array.each_with_index do |character,index|
      if @character_set.include?(character) == false
        return_array << character
      elsif (index + 1) % 4 == 0 || (index + 1 == 4)
        return_array << shift_character(character,@d_shift)
      elsif (index + 1) % 4 == 3 || (index + 1 == 3)
        return_array << shift_character(character,@c_shift)
      elsif (index + 1) % 4 == 2 || (index + 1 == 2)
        return_array << shift_character(character,@b_shift)
      elsif (index + 1) % 4 == 1 || (index + 1 == 1)
        return_array << shift_character(character,@a_shift)
      end
    end
    return_array.join("")

    return_hash[:encryption] = return_array.join("")
    return_hash[:key] = @key_gen.input
    return_hash[:date] = @date

    return_hash
  end

end
