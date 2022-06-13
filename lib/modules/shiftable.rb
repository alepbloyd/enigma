require './lib/modules/ABCDKeyable'
require './lib//modules/offsettable'

module Shiftable
  include ABCDKeyable
  include Offsettable

  def a_shift(key,date)
    a_key(key).to_i + a_offset(date).to_i
  end

  def b_shift(key,date)
    b_key(key).to_i + b_offset(date).to_i
  end

  def c_shift(key,date)
    c_key(key).to_i + c_offset(date).to_i
  end

  def d_shift(key,date)
    d_key(key).to_i + d_offset(date).to_i
  end

end
