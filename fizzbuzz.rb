#!env ruby
100.times do |x|
  print 'Fizz' if fizz = x % 3 == 0
  print 'Buzz' if buzz = x % 5 == 0
  print x if not (fizz or buzz)
  puts
end
