require './lib/enigma'
require 'pry'

@enigma = Enigma.new
@key_gen = KeyGenerator.new(ARGV[2])

@code_key = @key_gen.code_key
@date = ARGV[3]

@input_file = File.open(ARGV[0],"r")
@output_file = File.open(ARGV[1],"w")

@output_hash = @enigma.decrypt(@input_file.read,@code_key,@date)

@output_file.write(@output_hash[:decryption])

puts "Created '#{@output_file}' with the key '#{ARGV[2] || @code_key}' and the date '#{@date}'"
