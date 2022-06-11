require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/offsetter'
require "pry"

RSpec.describe Offsetter do

  before(:each) do
    @offsetter = Offsetter.new('040895')
  end

  it 'exists' do
    expect(@offsetter).to be_instance_of(Offsetter)
  end

  it 'returns squared date' do
    expect(@offsetter.squared_date).to eq(1672401025)
  end

  it 'returns a_offset' do
    expect(@offsetter.a_offset).to eq(1)
  end

  it 'returns b_offset' do
    expect(@offsetter.b_offset).to eq(0)
  end

  it 'returns c_offset' do
    expect(@offsetter.c_offset).to eq(2)
  end

end
