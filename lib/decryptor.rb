require 'key_generator'
require 'date_generator'
require 'a_b_c_d_keysetter'
require 'offsetter'
require 'enigma'
require 'digest'

class Decryptor

  attr_reader :encrypted_message

  def initialize(encrypted_message,key,date)
    @encrypted_message = encrypted_message
  end

end
