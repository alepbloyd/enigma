require 'simplecov'
SimpleCov.start
require './lib/enigma'

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_instance_of (Enigma)
  end

  it 'returns "A" key from number' do
    expect(@enigma.a_key('02715')).to eq('02')
  end

  it 'returns "B" key from number' do
    expect(@enigma.b_key('02715')).to eq('27')
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
