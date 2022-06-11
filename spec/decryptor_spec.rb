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

  it 'returns five digit key' do
    expect(@example_decryptor.key).to eq("02715")

    expect(@example_with_password.key).to eq("02816")
  end

  it 'returns encryption date' do
    expect(@example_decryptor.date).to eq("040895")

    expect(@example_with_password.date).to eq("040895")
  end

  it 'returns character shifted by specified amount' do
    expect(@example_decryptor.shift_character("k",3)).to eq("h")

    expect(@example_decryptor.shift_character("e",27)).to eq("e")

    expect(@example_decryptor.shift_character("d",73)).to eq("l")

    expect(@example_decryptor.shift_character("e",20)).to eq("l")

    expect(@example_decryptor.shift_character("r",3)).to eq("o")
  end

  it 'returns decrypt hash' do
    expect(@example_decryptor.decrypt).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })

    expect(@example_with_password.decrypt).to eq({
      decryption: "hello world",
      key: "SpaghettiBoi",
      date: "040895"
      })
    end
end
