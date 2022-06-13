require './lib/enigma'

@enigma = Enigma.new
@input_file = File.open(ARGV[0],"r")
@output_file = File.open(ARGV[1],"w")

@date = ARGV[2]

@key = @enigma.crack(@input_file.read,@date)

binding.pry

@output_hash = @enigma.decrypt(@input_file.read,@key,@date)

@output_file.write(@output_hash[:decryption])

puts "Created #{ARGV[1]} with the key #{@key} and date #{@date}"
