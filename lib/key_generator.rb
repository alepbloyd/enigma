require 'pry'
require 'digest'

# this is a sort of self assigned extension, thought it would be interesting to see if I could have the user input take strings as passwords instead of a five digit code, and then convert password to five digit code to work with the rest of the program

class KeyGenerator

  attr_reader :input,
              :input_data_type,
              :input_hash

  def initialize(input = nil)
    @input = input
    @input_data_type = input.class
    @input_hash = Digest::SHA1.base64digest(input.to_s)
  end

  def generate_five_digit_key
    if @input == nil
      generate_random_five_digit_key
    elsif @input.five_digit_string?
      @input
    else
      key_from_password
    end
  end

  def random_digit
    rand(9)
  end

  def generate_random_five_digit_key
    return_string = ""
    5.times {return_string += random_digit.to_s}
  end

  def hash_base64
    @input_hash = Digest::SHA1.base64digest(@input)
  end

  def input_hash_first_5
    @input_hash[0,5]
  end

  def ord_numbers_for_first_five
    return_array = []
    chars = input_hash_first_5.split('')
    chars.each do |char|
      return_array << char.ord
    end
    return_array
  end

  def first_five_ord_numbers_joined
    ord_numbers_for_first_five.map {|number| number.to_s}.join.to_i
  end

  def first_five_ord_numbers_joined_and_squared
    first_five_ord_numbers_joined ** 2
  end

  def key_from_password
    first_five_ord_numbers_joined_and_squared.to_s[-5,5]
  end

end
