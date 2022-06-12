class DateGenerator

  attr_reader :date

  def initialize(input = nil)
    if input == nil
      @date = Date.today.strftime("%e%m%y").to_s
    else
      @date = input
    end
  end


end
