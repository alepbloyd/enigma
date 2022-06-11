require 'key_generator'
require 'date_generator'
require 'a_b_c_d_keysetter'
require 'offsetter'
require 'enigma'
require 'digest'

class Decryptor

  attr_reader :encrypted_message,
              :key,
              :date

  def initialize(encrypted_message,key,date)
    @encrypted_message = encrypted_message

    @key_gen = KeyGenerator.new(key)
    @key = @key_gen.code_key

    @date = date

    @abcd_gen = ABCDKeySetter.new(@key)
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
    return_index = index - shift_amount
    if return_index >= 0 && return_index <= 27
      return @character_set[return_index]
    elsif return_index < 0
      @character_set[return_index % 27]
    end
  end

  def input_array
    @encrypted_message.chars
  end

  def decrypt
    return_array = []
    return_hash = {}

    input_array.each_with_index do |character,index|
      if (index + 1) % 4 == 0 || (index + 1 == 4)
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

    return_hash[:decryption] = return_array.join("")
    return_hash[:key] = @key_gen.input
    return_hash[:date] = @date

    return_hash
  end
end