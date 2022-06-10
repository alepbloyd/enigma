require 'key_generator'
require 'enigma'
require 'digest'

class DateGenerator

  attr_reader :input

  def initialize(input = nil)
    @input = input.to_s
  end

  def valid_length?
    @input.length == 6
  end

  def valid_month?
    month_string = @input[2..3]
    month_string.to_i > 0 && month_string.to_i <= 12
  end
end
