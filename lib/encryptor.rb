require 'key_generator'
require 'date_generator'
require 'enigma'
require 'digest'

class Encryptor

  attr_reader :input_message,
              :code_key,
              :date,
              :character_set

  def initialize(input_message,code_key = nil,date = nil)
    key_gen = KeyGenerator.new(code_key)
    date_gen = DateGenerator.new(date)

    @input_message = input_message
    @code_key = key_gen.code_key
    @date = date_gen.date

    @character_set = ["a", "b", "c", "d", "e",
                      "f", "g", "h", "i", "j",
                      "k", "l", "m", "n", "o",
                      "p", "q", "r", "s", "t",
                      "u", "v", "w", "x", "y",
                      "z", " "]
  end

end
