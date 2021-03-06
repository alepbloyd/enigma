require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require 'digest'

RSpec.describe KeyGenerator do

  before(:each) do
    @key_generator1 = KeyGenerator.new("27150")
    @key_generator2 = KeyGenerator.new("Beefaroni")
    @key_generator3 = KeyGenerator.new
  end

  it 'exists' do
    expect(@key_generator1).to be_instance_of(KeyGenerator)
  end

  it 'returns random digit between 0 and 9' do
    allow(@key_generator1).to receive(:random_digit).and_return(8)

    expect(@key_generator1.random_digit).to eq(8)
  end

  it 'returns SHA1_base64_digest hash for string' do
    expect(@key_generator2.hash_base64).to eq("q84k4HpPRNqSDTesNapvEOhObHI=")
  end

  it 'returns first five characters of base64 hash' do
    expect(@key_generator2.input_hash_first_5).to eq("q84k4")
  end

  it 'returns ord numbers for first five characters of base64 hash' do
    expect(@key_generator2.ord_numbers_for_first_five).to eq([113,56,52,107,52])
  end

  it 'generates a random digit' do
    allow(@key_generator).to receive(:random_digit).and_return(5)
    
    expect(@key_generator.random_digit).to eq(5)
  end

  it 'sums first five ord numbers joined' do
    expect(@key_generator2.first_five_ord_numbers_joined).to eq(113565210752)
  end

  it 'returns square of joined ord numbers' do
    expect(@key_generator2.first_five_ord_numbers_joined_and_squared).to eq(12897057093146176405504)
  end

  it 'returns string of last five digits of squared ord numbers' do
    expect(@key_generator2.key_from_password).to eq('05504')
  end

  it 'generates random five digit string' do
    allow(@key_generator3).to receive(:generate_random_five_digit_key).and_return('86753')

    expect(@key_generator3.generate_random_five_digit_key).to eq("86753")
  end

  it 'checks if input is a five digit string' do
    expect(@key_generator1.input_five_digit_string?).to be true
    expect(@key_generator2.input_five_digit_string?).to be false
    expect(@key_generator3.input_five_digit_string?).to be false
  end

  it 'returns key for input' do
    expect(@key_generator1.code_key).to eq('27150')

    expect(@key_generator2.code_key).to eq('05504')

    allow(@key_generator3).to receive(:code_key).and_return('86753')

    expect(@key_generator3.code_key).to eq('86753')
  end

end
