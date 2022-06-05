require 'simplecov'
SimpleCov.start
require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new
  end

  it 'returns hash of encryption, key, and date' do
    enigma = Enigma.new

    expect(enigma.encrypt("hello world", "02715", "040895")).to be_instance_of(Hash)
    
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
   })
  end

end
