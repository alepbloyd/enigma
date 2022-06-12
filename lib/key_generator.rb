require 'digest'

class KeyGenerator

  attr_reader :input,
              :input_hash

  def initialize(input = nil)
    @input = input
  end

  def input_five_digit_string?
    if @input == nil
      return false
    end
    input_chars = @input.split("")
    input_chars.all? {|char| char.to_s == char.to_i.to_s}
  end

  def code_key
    if @input == nil
      generate_random_five_digit_key
    elsif input_five_digit_string?
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
    return_string
  end

  def hash_base64
    Digest::SHA1.base64digest(@input)
  end

  def input_hash_first_5
    hash_base64[0,5]
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
