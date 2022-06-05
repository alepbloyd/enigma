require 'simplecov'
SimpleCov.start
require './lib/enigma'
require "pry"

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of (Enigma)
  end

  it 'initializes with array of characters' do
    expect(@enigma.character_set).to be_instance_of (Array)
    expect(@enigma.character_set).to eq (["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'returns "A" key from number' do
    expect(@enigma.a_key('02715')).to eq('02')
  end

  it 'returns "B" key from number' do
    expect(@enigma.b_key('02715')).to eq('27')
  end

  it 'returns "C" key from number' do
    expect(@enigma.c_key('02715')).to eq('71')
  end

  it 'returns "D" key from number' do
    expect(@enigma.d_key('02715')).to eq('15')
  end

  it 'returns squared date value' do
    expect(@enigma.squared_date('040895')).to eq(1672401025)
  end

  it 'returns a_offset from date' do
    expect(@enigma.a_offset('040895')).to eq(1)
  end

  it 'returns b_offset from date' do
    expect(@enigma.b_offset('040895')).to eq(0)
  end

  it 'returns c_offset from date' do
    expect(@enigma.c_offset('040895')).to eq(2)
  end

  it 'returns d_offset from date' do
    expect(@enigma.d_offset('040895')).to eq(5)
  end

  it 'returns character offset by specified number' do
    expect(@enigma.shift_character("h",3)).to eq("k")

    expect(@enigma.shift_character("e",27)).to eq("e")

    expect(@enigma.shift_character("l",73)).to eq("d")

    expect(@enigma.shift_character("l",20)).to eq("e")

    expect(@enigma.shift_character("o",3)).to eq("r")

    expect(@enigma.shift_character(" ",27)).to eq(" ")
  end

  it 'returns input string as array' do
    expect(@enigma.input_array("hello world")).to be_instance_of (Array)

    expect(@enigma.input_array("hello world")).to eq (['h','e','l','l','o',' ','w','o','r','l','d']) 
  end

  xit 'returns hash of encryption, key, and date' do

    expect(enigma.encrypt("hello world", "02715", "040895")).to be_instance_of(Hash)

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
   })
  end

end
