require 'key_generator'
require 'enigma'
require 'digest'

class Encryptor

  attr_reader :input_message,
              :input_key,
              :input_date

  def initialize(input_message,input_key = nil,input_date = nil)
    @input_message = input_message
    @input_key = input_key
    @input_date = input_date
  end

end
