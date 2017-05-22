def calculate(num1,operator, num2)
  if operator == '+'
    num1 + num2
  elsif operator == '-'
    num1 - num2
  elsif operator == '*'
    num1 * num2
  elsif operator == '/'
    num1.to_f/num2.to_f
  end
  
end

puts "what would you want to calculate?"
calculate = gets.chomp.split(' ')
num1 = calculate[0].to_i
num2 = calculate[2].to_i
operator = calculate[1]

calculate(num1,operator,num2)


=begin
puts calculate(4, '+', 5)
puts calculate(4, '-', 5)
puts calculate(4, '*', 5)
puts calculate(4, '/', 5)
=end