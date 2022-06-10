require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require "pry"

RSpec.describe KeyGenerator do

  before(:each) do
    @key_generator = KeyGenerator.new(5)
  end

  it 'exists' do
    expect(@key_generator).to be_instance_of(KeyGenerator)
  end

  it 'returns length' do
    expect(@key_generator.length).to eq(5)
  end

  it 'generates a digit' do
    allow(@key_generator).to receive(:generate_digit).and_return(8)

    expect(@key_generator.generate_digit).to eq(8)
  end

end
