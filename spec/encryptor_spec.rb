require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/encryptor'
require './lib/modules/shiftable'
require 'digest'
require 'pry'

RSpec.describe Encryptor do

  before(:each) do

    @encryptor_only_message = Encryptor.new("hello world")

    @encryptor_with_number = Encryptor.new("hello world","27510")

    @encryptor_with_number_and_date = Encryptor.new("hello world","12121","040895")

    @encryptor_with_password = Encryptor.new("hello world","Beefaroni")

    @encryptor_with_password_and_date = Encryptor.new("hello world","SpaghettiBoi","040895")

    @encryptor_example = Encryptor.new("hello world", "02715", "040895")
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

  it 'returns character offset by specified number' do
    expect(@encryptor_with_number_and_date.shift_character("h",3)).to eq("k")

    expect(@encryptor_with_number_and_date.shift_character("e",27)).to eq("e")

    expect(@encryptor_with_number_and_date.shift_character("l",73)).to eq("d")

    expect(@encryptor_with_number_and_date.shift_character("l",20)).to eq("e")

    expect(@encryptor_with_number_and_date.shift_character("o",3)).to eq("r")

    expect(@encryptor_with_number_and_date.shift_character(" ",27)).to eq(" ")
  end

  it 'returns total a_shift' do
    expect(@encryptor_with_number_and_date.a_shift_total).to eq(13)
  end

  it 'returns total b_shift' do
    expect(@encryptor_with_number_and_date.b_shift_total).to eq(21)
  end

  it 'returns total c_shift' do
    expect(@encryptor_with_number_and_date.c_shift_total).to eq(14)
  end

  it 'returns total d_shift' do
    expect(@encryptor_with_number_and_date.d_shift_total).to eq(26)
  end

  it 'returns input message as array' do
    expect(@encryptor_with_number_and_date.input_array).to eq(['h','e','l','l','o',' ','w','o','r','l','d'])
  end

  it 'returns hash of encryption, key, and date' do
    expect(@encryptor_example.encrypt).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })

    expect(@encryptor_with_password_and_date.encrypt).to eq({
      encryption: "kfnfrayiumf",
      key: "SpaghettiBoi",
      date: "040895"
      })
  end

  it 'encrypts unincluded characters as themselves' do
    @encryptor_example_punctuation = Encryptor.new("hello world!", "02715", "040895")

    expect(@encryptor_example_punctuation.encrypt).to eq({
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
      })
  end

  it 'encrypts uppercase characters as lowercase' do
    @encryptor_example_uppercase = Encryptor.new("hElLo wORlD!", "02715", "040895")

    expect(@encryptor_example_uppercase.encrypt).to eq({
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
      })
  end

end
