require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require './lib/date_generator'
require './lib/a_b_c_d_keysetter'
require './lib/encryptor'
require './lib/decryptor'
require './lib/cracker'
require './lib/brute_force_cracker'
require 'digest'
require 'pry'

RSpec.describe BruteForceCracker do

  before(:each) do
    @enigma = Enigma.new
    @encryption_hash = @enigma.encrypt("hello world end", "08304", "291018")

    @brute_force_cracker = BruteForceCracker.new("vjqtbeaweqihssi", "291018")
  end

  it 'exists' do
    expect(@brute_force_cracker).to be_instance_of(BruteForceCracker)
  end

  it 'returns input string' do
    expect(@brute_force_cracker.input_string).to eq("vjqtbeaweqihssi")
  end

  it 'returns input date' do
    expect(@brute_force_cracker.date).to eq("291018")
  end

  it 'initiazes with strings "00000" through "99999" in array' do
    expect(@brute_force_cracker.potential_keys).to be_instance_of(Array)
    expect(@brute_force_cracker.potential_keys.length).to eq(100_000)
  end


  xit 'returns last four characters of output' do

  end

  xit 'verifies if last four characters equal " end"' do

  end

end
