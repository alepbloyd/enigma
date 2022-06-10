require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require 'digest'

require "pry"

RSpec.describe KeyGenerator do

  before(:each) do
    @key_generator1 = KeyGenerator.new(27150)
    @key_generator2 = KeyGenerator.new("Beefaroni")
  end

  it 'exists' do
    expect(@key_generator1).to be_instance_of(KeyGenerator)
  end

  it 'returns integer if input is integer' do
    expect(@key_generator1.input_data_type).to be Integer
  end

  it 'returns string if input is string' do
    expect(@key_generator2.input_data_type).to be String
  end

  it 'returns random digit between 0 and 9' do
    allow(@key_generator1).to receive(:random_digit).and_return(8)

    expect(@key_generator1.random_digit).to eq(8)
  end

  it 'returns SHA1_base64_digest hash for string' do
    expect(@key_generator2.hash_base64).to eq("q84k4HpPRNqSDTesNapvEOhObHI=")
  end

  it 'returns first five characters of base64 hash' do
    expect(@key_generator2.input_hash_first_5).to eq("q84k4")
  end

end
