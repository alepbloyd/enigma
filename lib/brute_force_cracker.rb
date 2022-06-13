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
              :date,
              :potential_keys

  def initialize(input_string, date)
    @input_string = input_string
    @date = date

    @potential_keys = []

    i = 0
    until i == 100_000
      @potential_keys << ("%05d" % i).to_s
      i += 1
    end
  end

  def attempt_crack(key)
    attempt = Decryptor.new(@input_string,key,@date)
  end

end
