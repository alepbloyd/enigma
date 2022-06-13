require 'digest'
require './lib/key_generator'
require './lib/date_generator'
require './lib/shiftable'

class Encryptor
  include Shiftable

  attr_reader :input_message,
              :code_key,
              :date,
              :character_set

  def initialize(input_message,code_key = nil,date = nil)
    @input_message = input_message

    @key_gen = KeyGenerator.new(code_key)
    @code_key = @key_gen.code_key

    @date_gen = DateGenerator.new(date)
    @date = @date_gen.date

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
    return_index = index + shift_amount
    if return_index > 27
      @character_set[return_index % 27]
    else
      return @character_set[return_index]
    end
  end

  def input_array
    @input_message.downcase.chars
  end

  def encrypt
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

    return_hash[:encryption] = return_array.join("")
    return_hash[:key] = @key_gen.input
    return_hash[:date] = @date

    return_hash
  end

end
