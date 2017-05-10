puts "What is the hamster's name?"
name = gets.chomp

puts "What volume level of the hamster? (Range 1 to 10)"
volume = gets.chomp.to_i

puts "what is the fur color?"
fur_color=gets.chomp

puts "Is the hamster adoptable? (Yes/No)"
adoptable = gets.chomp

puts "How many years old is the hamster?(estimate)"
age = gets.chomp
if age == ''
  age = nil
else
  age = age.to_i
end

puts "The name is #{name}."
puts "The volume is #{volume}."
puts "The fur color is #{fur_color}."
puts "Adoptable? #{adoptable}."

if age == nil
  puts "no age information available"
else 
  puts "the hamster is #{age} years old"
end
