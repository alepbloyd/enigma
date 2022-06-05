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

  xit 'returns hash of encryption, key, and date' do

    expect(enigma.encrypt("hello world", "02715", "040895")).to be_instance_of(Hash)

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
   })
  end

end
