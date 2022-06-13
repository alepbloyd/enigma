require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require './lib/encryptor'
require './lib/decryptor'
require 'digest'
require 'pry'

class BruteForceCracker

  attr_reader :input_string,
              :date

  def initialize(input_string, date)
    @input_string = input_string
    @date = date
  end

end
