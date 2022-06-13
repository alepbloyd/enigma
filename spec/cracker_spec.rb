require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require './lib/encryptor'
require './lib/decryptor'
require './lib/cracker'
require 'digest'
require 'pry'

RSpec.describe Cracker do

  before(:each) do
    @enigma = Enigma.new
    @encryption_hash = @enigma.encrypt("hello world end", "08304", "291018")

    @cracker = Cracker.new("vjqtbeaweqihssi", "291018")
  end

  it 'exists' do
    expect(@cracker).to be_instance_of(Cracker)
  end

  it 'returns input string' do
    expect(@cracker.input_string).to eq("vjqtbeaweqihssi")
  end

  it 'returns input date' do
    expect(@cracker.date).to eq("291018")
  end

  it 'returns length of input_string' do
    expect(@cracker.length).to eq(15)
  end

  it 'initializes with character_set' do
    expect(@cracker.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'returns a_offset' do
    expect(@cracker.a_offset).to eq(6)
  end

  it 'returns b_offset' do
    expect(@cracker.b_offset).to eq(3)
  end

  it 'returns c_offset' do
    expect(@cracker.c_offset).to eq(2)
  end

  it 'returns d_offset' do
    expect(@cracker.d_offset).to eq(4)
    #is it this?
  end

  it 'returns a,b,c,d position for final character' do
    expect(@cracker.final_character_position).to eq("c")
  end

  it 'returns a,b,c,d pattern for final four characters' do
    expect(@cracker.final_four_pattern).to eq(['d','a','b','c'])
  end

  it 'returns index of final character' do
    expect(@cracker.final_char_index).to eq(8)
  end

  it 'returns index of 2nd to last char' do
    expect(@cracker.second_last_char_index).to eq(18)
  end

  it 'returns index of 3rd to last char' do
    expect(@cracker.third_last_char_index).to eq(18)
  end

  it 'returns index of 4th to last char' do
    expect(@cracker.fourth_last_char_index).to eq(7)
  end

  it 'determines difference between last character and "d"' do
    expect(@cracker.final_char_diff).to eq(5)
  end

  it 'determines difference between 2nd to last character and "n"' do
    expect(@cracker.second_last_char_diff).to eq(5)
  end

  it 'determines difference between 3rd to last character and "e"' do
    expect(@cracker.third_last_char_diff).to eq(14)
  end

  it 'determines difference between 4th to last character and " " (space)' do
    expect(@cracker.fourth_last_char_diff).to eq(19)
  end

  it 'returns a_key' do
    expect(@cracker.a_key_initial).to eq("08")
  end

  it 'returns array of options between 0 and 100 for a_key' do
    expect(@cracker.a_key_options).to eq(["08","35","62","89"])
  end

  xit 'returns b_key' do
    #need some way to address that this reduces down to "02"
    expect(@cracker.b_key).to eq("83")
  end

  xit 'returns c_key' do
    #need some way to address that this reduces down to "03"
    expect(@cracker.c_key).to eq("30")
  end

  xit 'returns d_key' do
    expect(@cracker.a_key).to eq("04")
  end

  xit 'returns complete key' do
    expect(@cracker.key).to eq("08304")
  end

  # now need to remove offset from the difference, and I should have something I can reassemble into the key

  #if getting 'reduced key', like 83 -> 2, add 27 until first digit of next key matches last digit of previous key

end
