require 'digest'
require 'date'
require './lib/key_generator'
require './lib/encryptor'
require './lib/decryptor'
require './lib/brute_force_cracker'
require './modules/ABCDKeyable'
require './modules/offsettable'
require './modules/shiftable'

class Enigma

  def initialize
  end

  def encrypt(input,code_key = nil,date = Date.today.strftime("%e%m%y").to_s)
    Encryptor.new(input,code_key,date).encrypt
  end

  def decrypt(input,code_key,date = Date.today.strftime("%e%m%y").to_s)
    Decryptor.new(input,code_key,date).decrypt
  end

  def crack(input,date = Date.today.strftime("%e%m%y").to_s)
    BruteForceCracker.new(input,date).crack
  end

end
