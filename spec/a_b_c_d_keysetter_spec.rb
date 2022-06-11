require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require "pry"

RSpec.describe ABCDKeySetter do

  before (:each) do
    @key_setter = ABCDKeySetter.new('02715')
  end

  it 'exists' do
    expect(@key_setter).to be_instance_of(ABCDKeySetter)
  end

  it 'returns a_key' do
    expect(@key_setter.a_key).to eq('02')
  end

  it 'returns b_key' do
    expect(@key_setter.b_key).to eq('27')
  end

  it 'returns c_key' do
    expect(@key_setter.c_key).to eq('71')
  end

end
