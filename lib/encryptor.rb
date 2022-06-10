require 'key_generator'
require 'enigma'
require 'digest'

class Encryptor

  attr_reader :input_message,
              :code_key,
              :input_date

  def initialize(input_message,code_key = nil,input_date = nil)
    key_gen = KeyGenerator.new(code_key)

    @input_message = input_message
    @code_key = key_gen.code_key
    @input_date = input_date
  end

end
