require 'key_generator'
require 'date_generator'
require 'encryptor'
require 'decryptor'
require 'a_b_c_d_keysetter'
require 'offsetter'
require 'digest'


class Enigma

  def initialize
  end

  def encrypt(input,code_key = nil,date = nil)
    encryptor = Encryptor.new(input,code_key,date)

    encryptor.encrypt
  end

  def decrypt(input,code_key,date= nil)
    decryptor = Decryptor.new(input,code_key,date)

    decryptor.decrypt
  end

end
