require 'pry'

class KeyGenerator

  #read an input
  #if it's a string, convert it to a five digit hash (not random)
  #if it's an integer of five digits, use that instead of hash

  attr_reader :input,
              :input_data_type

  def initialize(input)
    @input = input
    @input_data_type = input.class
  end

  def length
    if @input_data_type == Integer
      @input
    elsif @input_data_type == String
      @input.length
    end
  end

  def random_digit
    rand(9)
  end

end
