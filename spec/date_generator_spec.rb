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
    @date_generator_bad_length = DateGenerator.new("1212121")
    @date_generator_bad_day = DateGenerator.new("350892")
    @date_generator_bad_month = DateGenerator.new("351392")
  end

  it 'exists' do
    expect(@date_generator_with_input).to be_instance_of(DateGenerator)

    expect(@date_generator_no_input).to be_instance_of(DateGenerator)
  end

  it "checks input date format for length validity" do
    expect(@date_generator_with_input.valid_length?).to be true

    expect(@date_generator_bad_length.valid_length?).to be false
  end

  it 'checks validity of month of date input' do
    expect(@date_generator_with_input.valid_month?).to be true

    expect(@date_generator_bad_month.valid_month?).to be false
  end

  it 'checks validity of day of date input' do
    expect(@date_generator_with_input.valid_day?).to be true

    expect(@date_generator_bad_day.valid_day?).to be false
  end

  xit 'returns input if input in correct format' do

  end

end
