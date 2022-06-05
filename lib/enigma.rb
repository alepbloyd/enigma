class Enigma

  attr_reader :character_set

  def initialize
    @character_set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
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

  def d_offset(date)
    squared_date(date).to_s[-1].to_i
  end

end
