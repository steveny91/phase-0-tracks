
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
  history = []
  ops = "+*-/"
  numbers ="0123456789"
  quit = false
  until quit == true 
  puts "what would you want to calculate(0-9, +-*/)? Type done to exit"
  input = gets.chomp
  calculate = input.split('')
  calculate.delete(" ") # incase user does not space correctly
    if ops.include? calculate[1] and numbers.include? calculate[0] and numbers.include? calculate[2]
        num1 = calculate[0].to_i
        num2 = calculate[2].to_i
        operator = calculate[1]
        result = calculate(num1,operator,num2)
        puts result
        history << "#{num1} #{operator} #{num2} = #{result}"
    elsif input == "done"
      quit = true
    else 
      puts "error please check input"
    end
  end
  numdone =  history.length 
  puts "#{numdone} calculations completed"
  puts history
end

calculatorloop
=begin
puts calculate(4, '+', 5)
puts calculate(4, '-', 5)
puts calculate(4, '*', 5)
puts calculate(4, '/', 5)
=end


=begin
psuedo for error check
check if operators are inside of a list of operator if not return error and
check for numbers if one is not number return error
else if input is "done" quit
else error
  
=end