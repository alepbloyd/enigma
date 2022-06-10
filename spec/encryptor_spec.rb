require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/encryptor'
require 'digest'

RSpec.describe Encryptor do

  before(:each) do

    @encryptor_with_number = Encryptor.new("hello world","27510")

    @encryptor_with_number_and_date = Encryptor.new("hello world","27510","040895")

    @encryptor_with_password = Encryptor.new("hello world","Beefaroni")

    @encryptor_with_password_and_date = Encryptor.new("hello world","Beefaroni","040895")
  end

  it 'exists' do
    expect(@encryptor_with_number).to be_instance_of(Encryptor)

    expect(@encryptor_with_number_and_date).to be_instance_of(Encryptor)

    expect(@encryptor_with_password).to be_instance_of(Encryptor)

    expect(@encryptor_with_password_and_date).to be_instance_of(Encryptor)
  end

  it 'returns input string' do
    expect(@encryptor_with_number.input_message).to eq("hello world")
    expect(@encryptor_with_number_and_date.input_message).to eq("hello world")
    expect(@encryptor_with_password.input_message).to eq("hello world")
    expect(@encryptor_with_password_and_date.input_message).to eq("hello world")
  end

end
