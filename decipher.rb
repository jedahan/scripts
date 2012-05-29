#!/usr/bin/ruby
file = File.new(ARGV[0], "r")
cipher = file.gets.to_i
alphabets = [
  'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  'abcdefghijklmnopqrstuvwxyz'
]

while (line = file.gets) do
  line.each_char do |c|
    decoded = c

    for alphabet in alphabets
      if index = alphabet.index(decoded)
        decoded = alphabet[(index - cipher) % 26].chr
        break
      end
    end

    print decoded
  end
end

file.close
