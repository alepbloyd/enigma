class KeyGenerator

  attr_reader :length

  def initialize(length)
    @length = length.to_i
  end

  def generate_digit
    rand(9)
  end


end
