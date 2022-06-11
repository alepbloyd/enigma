require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require "pry"

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of (Enigma)
  end

end
