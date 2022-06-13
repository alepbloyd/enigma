require './lib/enigma'

@enigma = Enigma.new
@key_gen = KeyGenerator.new(ARGV[2])

@code_key = @key_gen.code_key

if ARGV[3] == nil
  @date = Date.today.strftime("%e%m%y")
else
  @date = ARGV[3]
end

@input_file = File.open(ARGV[0],"r")
@output_file = File.open(ARGV[1],"w")

@output_hash = @enigma.decrypt(@input_file.read,@code_key,@date)

@output_file.write(@output_hash[:decryption])

puts "Created '#{ARGV[1]}' with the key '#{ARGV[2] || @code_key}' and the date '#{@date}'"
