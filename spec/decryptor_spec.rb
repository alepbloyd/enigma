require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require './lib/encryptor'
require './lib/decryptor'
require 'digest'

RSpec.describe Decryptor do

  before(:each) do
    @example_decryptor = Decryptor.new("keder ohulw","02715","040895")

    @example_with_password = Decryptor.new("kfnfrayiumf","SpaghettiBoi","040895")
  end

  it 'exists' do
    expect(@example_decryptor).to be_instance_of(Decryptor)

    expect(@example_with_password).to be_instance_of(Decryptor)
  end

  it 'returns encrypted message' do
    expect(@example_decryptor.encrypted_message).to eq("keder ohulw")

    expect(@example_with_password.encrypted_message).to eq("kfnfrayiumf")
  end

end
