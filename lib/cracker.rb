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
              :length

  def initialize(input_string,date)
    @input_string = input_string
    @date = date
    @length = input_string.length
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
end
