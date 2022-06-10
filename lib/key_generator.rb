require 'pry'
require 'digest'

class KeyGenerator

  #read an input
  #if it's a string, convert it to a five digit hash (not random)
  #if it's an integer of five digits, use that instead of hash

  attr_reader :input,
              :input_data_type,
              :input_hash

  def initialize(input)
    @input = input
    @input_data_type = input.class
    @input_hash = Digest::SHA1.base64digest(input.to_s)
    @input_hash_first_5 = ""
  end

  def random_digit
    rand(9)
  end

  def hash_base64
    @input_hash = Digest::SHA1.base64digest(@input)
  end

  def input_hash_first_5
    @input_hash_first_5 = @input_hash[0,5]
  end

end
