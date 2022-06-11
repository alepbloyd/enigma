require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require "pry"

class Offsetter

  attr_reader :squared_date,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset

  def initialize(input)
    @squared_date = input.to_i ** 2
    @a_offset = @squared_date.to_s[-4].to_i
    @b_offset = @squared_date.to_s[-3].to_i
    @c_offset = @squared_date.to_s[-2].to_i
    @d_offset = @squared_date.to_s[-1].to_i
  end


end
