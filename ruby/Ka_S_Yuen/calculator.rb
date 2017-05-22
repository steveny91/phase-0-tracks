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

puts calculate(4, '+', 5)
puts calculate(4, '-', 5)
puts calculate(4, '*', 5)
puts calculate(4, '/', 5)