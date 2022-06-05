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

end
