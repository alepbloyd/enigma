require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/encryptor'
require './lib/date_generator'
require 'digest'

RSpec.describe DateGenerator do

  before(:each) do
    @date_generator_with_input = DateGenerator.new('040895')
    @date_generator_no_input = DateGenerator.new
  end

  it 'exists' do
    expect(@date_generator_with_input).to be_instance_of(DateGenerator)

    expect(@date_generator_no_input).to be_instance_of(DateGenerator)
  end

  xit 'returns input if input in correct format' do

  end

end
