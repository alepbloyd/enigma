module Offsettable

  def a_offset(date)
    (date.to_i ** 2).to_s[-4].to_i
  end

  def b_offset(date)
    (date.to_i ** 2).to_s[-3].to_i
  end

  def c_offset(date)
    (date.to_i ** 2).to_s[-2].to_i
  end

  def d_offset(date)
    (date.to_i ** 2).to_s[-1].to_i
  end

end
