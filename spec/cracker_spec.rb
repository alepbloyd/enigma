require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require './lib/encryptor'
require './lib/decryptor'
require './lib/cracker'
require 'digest'
require 'pry'

RSpec.describe Cracker do

  before(:each) do
    @enigma = Enigma.new
    @encryption_hash = @enigma.encrypt("hello world end", "08304", "291018")

    @cracker = Cracker.new("vjqtbeaweqihssi", "291018")
  end

  it 'exists' do
    expect(@cracker).to be_instance_of(Cracker)
  end

end
