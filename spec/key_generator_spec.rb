require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require "pry"

RSpec.describe KeyGenerator do

  before(:each) do
    @key_generator1 = KeyGenerator.new(5)
    @key_generator2 = KeyGenerator.new("Beefaroni")
  end

  it 'exists' do
    expect(@key_generator1).to be_instance_of(KeyGenerator)
  end

  it 'returns input_type' do
    expect(@key_generator1.input_data_type).to be Integer

    expect(@key_generator2.input_data_type).to be String
  end

  it 'returns length of integer inputs' do
    expect(@key_generator1.length).to eq(5)

    expect(@key_generator2.length).to eq(9)
  end

end
