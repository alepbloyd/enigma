require 'digest'
require_relative 'enigma'
require_relative 'key_generator'
require_relative 'date_generator'
require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'a_b_c_d_keysetter'
require_relative 'offsetter'

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
