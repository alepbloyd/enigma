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


end
