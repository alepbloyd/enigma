require 'digest'
require './lib/key_generator'
require './lib/modules/shiftable'

class Decryptor
  include Shiftable

  attr_reader :encrypted_message,
              :code_key,
              :date

  def initialize(encrypted_message,key,date = Date.today.strftime("%e%m%y").to_s)
    @encrypted_message = encrypted_message

    @key_gen = KeyGenerator.new(key)
    @code_key = @key_gen.code_key

    @date = date

    @character_set = ["a", "b", "c", "d", "e",
                      "f", "g", "h", "i", "j",
                      "k", "l", "m", "n", "o",
                      "p", "q", "r", "s", "t",
                      "u", "v", "w", "x", "y",
                      "z", " "]
  end

  def a_shift_total
    a_shift(@code_key,@date)
  end

  def b_shift_total
    b_shift(@code_key,@date)
  end

  def c_shift_total
    c_shift(@code_key,@date)
  end

  def d_shift_total
    d_shift(@code_key,@date)
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
    @encrypted_message.downcase.chars
  end

  def decrypt
    return_array = []
    return_hash = {}

    input_array.each_with_index do |character,index|
      if @character_set.include?(character) == false
        return_array << character
      elsif (index + 1) % 4 == 0 || (index + 1 == 4)
        return_array << shift_character(character,d_shift_total)
      elsif (index + 1) % 4 == 3 || (index + 1 == 3)
        return_array << shift_character(character,c_shift_total)
      elsif (index + 1) % 4 == 2 || (index + 1 == 2)
        return_array << shift_character(character,b_shift_total)
      elsif (index + 1) % 4 == 1 || (index + 1 == 1)
        return_array << shift_character(character,a_shift_total)
      end
    end
    return_array.join("")

    return_hash[:decryption] = return_array.join("")
    return_hash[:key] = @key_gen.input
    return_hash[:date] = @date

    return_hash
  end
end
