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

def calculatorloop
  quit = false
  until quit == true 
  puts "what would you want to calculate?"
  input = gets.chomp
  calculate = input.split(' ')
    if input == "done"
      quit = true
      return "goodbye"
    else
      num1 = calculate[0].to_i
      num2 = calculate[2].to_i
      operator = calculate[1]
      p calculate(num1,operator,num2)
    end
  end
end

calculatorloop


=begin
puts calculate(4, '+', 5)
puts calculate(4, '-', 5)
puts calculate(4, '*', 5)
puts calculate(4, '/', 5)
=end