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

    @character_set = ["a", "b", "c", "d", "e",
                      "f", "g", "h", "i", "j",
                      "k", "l", "m", "n", "o",
                      "p", "q", "r", "s", "t",
                      "u", "v", "w", "x", "y",
                      "z", " "]
  end

end
