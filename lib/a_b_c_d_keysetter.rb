class ABCDKeySetter

  attr_reader :a_key,
              :b_key,
              :c_key,
              :d_key

  def initialize(input)
    @a_key = input[0,2]
    @b_key = input[1,2]
    @c_key = input[2,2]
    @d_key = input[3,2]
  end

end
