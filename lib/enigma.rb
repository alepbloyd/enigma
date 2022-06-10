require 'key_generator'

class Enigma

  attr_reader :character_set

  def initialize
    @character_set = ["a", "b", "c", "d", "e",
                      "f", "g", "h", "i", "j",
                      "k", "l", "m", "n", "o",
                      "p", "q", "r", "s", "t",
                      "u", "v", "w", "x", "y",
                      "z", " "]
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

  def shift_character(start_character,shift_amount)
    index = @character_set.index(start_character)
    return_index = index + shift_amount
    if return_index > 27
      @character_set[return_index % 27]
    else
      return @character_set[return_index]
    end
  end

  def string_to_array(string)
    string.chars
  end

  def encrypt(message,key,date)
    a_key = a_key(key)
    b_key = b_key(key)
    c_key = c_key(key)
    d_key = d_key(key)

    a_offset = a_offset(date)
    b_offset = b_offset(date)
    c_offset = c_offset(date)
    d_offset = d_offset(date)

    message_array = string_to_array(message)

    return_array = []
    return_hash = {}

    message_array.each_with_index do |character,index|
      if (index + 1) % 4 == 0 || (index + 1 == 4)
        return_array << shift_character(character,d_key.to_i + d_offset)
      elsif (index + 1) % 4 == 3 || (index + 1 == 3)
        return_array << shift_character(character,c_key.to_i + c_offset)
      elsif (index + 1) % 4 == 2 || (index + 1 == 2)
        return_array << shift_character(character,b_key.to_i + b_offset)
      elsif (index + 1) % 4 == 1 || (index + 1 == 1)
        return_array << shift_character(character,a_key.to_i + a_offset)
      end
    end

    return_hash[:encryption] = return_array.join("")
    return_hash[:key] = key
    return_hash[:date] = date

    return_hash
  end

end
