require 'pry'

class KeyGenerator

  attr_reader :input,
              :input_data_type

  def initialize(input)
    @input = input
    @input_data_type = input.class
    # binding.pry
  end

  def length
    if @input_data_type == Integer

    end
  end

end
