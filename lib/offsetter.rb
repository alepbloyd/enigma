require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require "pry"

class Offsetter

  attr_reader :squared_date,
              :a_offset

  def initialize(input)
    @squared_date = input.to_i ** 2
    @a_offset = @squared_date.to_s[-4].to_i
  end


end
