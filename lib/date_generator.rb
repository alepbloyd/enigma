require 'key_generator'
require 'enigma'
require 'digest'

class DateGenerator

  attr_reader :input

  def initialize(input = nil)
    @input = input
  end

end
