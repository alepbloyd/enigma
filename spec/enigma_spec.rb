require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require "pry"

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of (Enigma)
  end

  it 'returns encrypted hash' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end

  it 'returns decrypted hash' do
    expect(@enigma.decrypt("keder ohulw","02715","040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
  end

  it 'returns key for crack' do
    expect(@enigma.crack("vjqtbeaweqihssi", "291018")).to eq("08304")
  end

end
