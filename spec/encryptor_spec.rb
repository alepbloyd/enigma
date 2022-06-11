require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/encryptor'
require 'digest'

RSpec.describe Encryptor do

  before(:each) do

    @encryptor_only_message = Encryptor.new("hello world")

    @encryptor_with_number = Encryptor.new("hello world","27510")

    @encryptor_with_number_and_date = Encryptor.new("hello world","12121","040895")

    @encryptor_with_password = Encryptor.new("hello world","Beefaroni")

    @encryptor_with_password_and_date = Encryptor.new("hello world","SpaghettiBoi","040895")
  end

  it 'exists' do
    expect(@encryptor_only_message).to be_instance_of(Encryptor)

    expect(@encryptor_with_number).to be_instance_of(Encryptor)

    expect(@encryptor_with_number_and_date).to be_instance_of(Encryptor)

    expect(@encryptor_with_password).to be_instance_of(Encryptor)

    expect(@encryptor_with_password_and_date).to be_instance_of(Encryptor)
  end

  it 'returns input message' do
    expect(@encryptor_only_message.input_message).to eq("hello world")

    expect(@encryptor_with_number.input_message).to eq("hello world")

    expect(@encryptor_with_number_and_date.input_message).to eq("hello world")

    expect(@encryptor_with_password.input_message).to eq("hello world")

    expect(@encryptor_with_password_and_date.input_message).to eq("hello world")
  end

  it 'returns key' do
    allow(@encryptor_only_message).to receive(:code_key).and_return('86753')

    expect(@encryptor_only_message.code_key).to eq('86753')

    expect(@encryptor_with_number.code_key).to eq('27510')

    expect(@encryptor_with_number_and_date.code_key).to eq("12121")

    expect(@encryptor_with_password.code_key).to eq('05504')

    expect(@encryptor_with_password_and_date.code_key).to eq('02816')
  end

  it 'returns date' do
    expect(@encryptor_only_message.date).to eq('100622')

    expect(@encryptor_with_number.date).to eq('100622')

    expect(@encryptor_with_number_and_date.date).to eq('040895')

    expect(@encryptor_with_password.date).to eq('100622')

    expect(@encryptor_with_password_and_date.date).to eq('040895')
  end

  it 'returns character_set' do
    expect(@encryptor_only_message.character_set).to eq(
                      ["a", "b", "c", "d", "e",
                      "f", "g", "h", "i", "j",
                      "k", "l", "m", "n", "o",
                      "p", "q", "r", "s", "t",
                      "u", "v", "w", "x", "y",
                      "z", " "])
  end

end
