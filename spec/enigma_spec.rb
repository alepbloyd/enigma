require 'simplecov'
SimpleCov.start
require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new
  end

end
