class Enigma

  attr_reader

  def initialize
  end

  def a_key(string)
    string[0,2]
  end

  def b_key(string)
    string[1,2]
  end

  def c_key(string)
    string[2,2]
  end

  def d_key(string)
    string[3,2]
  end

  def squared_date(date)
    date.to_i ** 2
  end

  def a_offset(date)
    squared_date(date).to_s[-4].to_i
  end

  def b_offset(date)
    squared_date(date).to_s[-3].to_i
  end

  def c_offset(date)
    squared_date(date).to_s[-2].to_i
  end

end
