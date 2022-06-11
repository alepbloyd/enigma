require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
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

    allow(@encryptor_only_message).to receive(:date).and_return('100622')

    expect(@encryptor_only_message.date).to eq('100622')

    allow(@encryptor_with_number).to receive(:date).and_return('100622')

    expect(@encryptor_with_number.date).to eq('100622')

    expect(@encryptor_with_number_and_date.date).to eq('040895')

    allow(@encryptor_with_password).to receive(:date).and_return('100622')

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

  it 'returns a_key' do
    expect(@encryptor_with_number.a_key).to eq('27')

    expect(@encryptor_with_number_and_date.a_key).to eq('12')
  end

  it 'returns b_key' do
    expect(@encryptor_with_number.b_key).to eq('75')

    expect(@encryptor_with_number_and_date.b_key).to eq('21')
  end

  it 'returns c_key' do
    expect(@encryptor_with_number.c_key).to eq('51')

    expect(@encryptor_with_number_and_date.c_key).to eq('12')
  end

  it 'returns d_key' do
    expect(@encryptor_with_number.d_key).to eq('10')

    expect(@encryptor_with_number_and_date.d_key).to eq('21')
  end

  it 'returns a_offset' do
    expect(@encryptor_with_number_and_date.a_offset).to eq(1)
  end

  it 'returns b_offset' do
    expect(@encryptor_with_number_and_date.b_offset).to eq(0)
  end

  it 'returns c_offset' do
    expect(@encryptor_with_number_and_date.c_offset).to eq(2)
  end

  it 'returns d_offset' do
    expect(@encryptor_with_number_and_date.d_offset).to eq(5)
  end

  it 'returns character offset by specified number' do
    expect(@encryptor_with_number_and_date.shift_character("h",3)).to eq("k")

    expect(@encryptor_with_number_and_date.shift_character("e",27)).to eq("e")

    expect(@encryptor_with_number_and_date.shift_character("l",73)).to eq("d")

    expect(@encryptor_with_number_and_date.shift_character("l",20)).to eq("e")

    expect(@encryptor_with_number_and_date.shift_character("o",3)).to eq("r")

    expect(@encryptor_with_number_and_date.shift_character(" ",27)).to eq(" ")
  end

  it 'returns total a_shift' do
    expect(@encryptor_with_number_and_date.a_shift).to eq(13)
  end

  it 'returns total b_shift' do
    expect(@encryptor_with_number_and_date.b_shift).to eq(21)
  end
end
