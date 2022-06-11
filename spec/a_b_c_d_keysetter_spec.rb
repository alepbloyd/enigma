require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require "pry"

RSpec.describe ABCDKeySetter do

  before (:each) do
    @key_setter = ABCDKeySetter('02715')
  end

  it 'exists' do
    expect(@key_setter).to be_instance_of(ABCDKeySetter)
  end

end
