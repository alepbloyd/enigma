require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/number_generator'
require "pry"

RSpec.describe NumberGenerator do

  before(:each) do
    @number_generator = NumberGenerator.new
  end

  it 'exists' do
    expect(number_generator).to be_instance_of(NumberGenerator)
  end

end
