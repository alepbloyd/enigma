require './lib/enigma'

@enigma = Enigma.new
@input_file = File.open(ARGV[0],"r")
@output_file = File.open(ARGV[1],"w")

@input_text = @input_file.read

@date = ARGV[2]

@key = @enigma.crack(@input_text,@date)

@output_hash = @enigma.decrypt(@input_text,@key,@date)

@output_file.write(@output_hash[:decryption])

puts "Created #{ARGV[1]} with the key #{@key} and date #{@date}"
