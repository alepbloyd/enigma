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

end
