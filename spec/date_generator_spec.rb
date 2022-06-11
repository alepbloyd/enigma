require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/encryptor'
require './lib/date_generator'
require 'digest'
require 'date'

RSpec.describe DateGenerator do

  before(:each) do
    @date_generator_with_input = DateGenerator.new('040895')
    @date_generator_no_input = DateGenerator.new
  end

  it 'exists' do
    expect(@date_generator_with_input).to be_instance_of(DateGenerator)

    expect(@date_generator_no_input).to be_instance_of(DateGenerator)
  end

  it 'returns current date in ddmmyy format if no date provided' do
    expect(@date_generator_no_input.date).to eq('100622')
  end

  it 'returns input date if provided' do
    expect(@date_generator_with_input.date).to eq('040895')
  end

end
