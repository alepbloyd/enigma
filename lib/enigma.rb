require 'digest'
require 'date'
require './lib/key_generator'
require './lib/date_generator'
require './lib/encryptor'
require './lib/decryptor'
require './lib/a_b_c_d_keysetter'
require './lib/offsetter'

class Enigma

  def initialize
  end

  def encrypt(input,code_key = nil,date = nil)
    encryptor = Encryptor.new(input,code_key,date)

    encryptor.encrypt

    #put all the output things in this class, not the runner
  end

  def decrypt(input,code_key,date= nil)
    decryptor = Decryptor.new(input,code_key,date)

    decryptor.decrypt

    #put all the output things in this class, not the runner
  end

end
