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
    expect(@key_generator1.input_type).to eq(Integer)

    expect(@key_generator2.input_type).to eq(String)
  end

  it 'returns length of integer inputs' do
    expect(@key_generator1.length).to eq(5)
  end

  # it 'generates a digit' do
  #   allow(@key_generator).to receive(:generate_digit).and_return(8)
  #
  #   expect(@key_generator.generate_digit).to eq(8)
  # end

end
