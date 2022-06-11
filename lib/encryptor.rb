require 'key_generator'
require 'enigma'
require 'digest'

class Encryptor

  attr_reader :input_message,
              :code_key,
              :date

  def initialize(input_message,code_key = nil,date = nil)
    key_gen = KeyGenerator.new(code_key)
    date_gen = DateGenerator.new(date)

    @input_message = input_message
    @code_key = key_gen.code_key
    @date = date_gen.date
  end

end
