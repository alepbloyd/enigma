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

    last_four_chars = attempt.decrypt[:decryption][-4,4]
  end

  def check_attempt(last_four_chars)
    last_four_chars == " end"
  end

  def crack
    return_key = ""
    @potential_keys.each do |key|
      last_four_chars = attempt_crack(key)
      if check_attempt(last_four_chars)
        return_key = key
      end
    end
    return_key
  end

end
