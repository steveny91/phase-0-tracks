=begin
Prompts user for information (name, address, email, phone etc) 
Save information accordingly
Ask if there's any mistake
If any allow corrections
If not show hash
=end

def moreinfo
  puts "please list any additional preference (favorite color, scene etc). Type done when done"
  other = []
  moreidea = TRUE
  until moreidea == false
    input = gets.chomp
    if input == "done"
      break
    else
      other << input
    end
  end
  Job_app[:notes]= other
end


Job_app = {}
def Client


puts "Please insert Name"
Job_app[:name]= gets.chomp
puts "Please insert an Address"
Job_app[:address]= gets.chomp
puts "Please insert a phone number"
Job_app[:phone]= gets.chomp.to_i
puts "Please name favorite shade of blue"
Job_app[:theme]= gets.chomp
puts "How many children do you have?"
Job_app[:children]= gets.chomp
puts "Estimated budget?"
Job_app[:budget]= gets.chomp.to_i
puts "Is this urgent? y/n"
urgent= gets.chomp.downcase
if urgent == "y"
  Job_app[:urgent]= TRUE
else
  Job_app[:urgent]= false
end
moreinfo


puts "Is the listed information correct? Y/N"
puts Job_app
mistake = gets.chomp.downcase
if mistake != "y"
  puts "what would you want to change? (name, address, phonenum, theme, numchildren, budget, urgency or other"
  selection = gets.chomp.to_sym
  if selection == :other
    moreinfo
  else
    puts "Please update the information"
    newdata = gets.chomp
    if newdata == :y
      newbool = TRUE
    else
      newbool = FALSE
    end
  end
  if selection == :name
    Job_app[:name]= newdata
  elsif selection == :address
    Job_app[:address]= newdata
  elsif selection == :phonenum
    Job_app[:phonenum]= newdata
  elsif selection == :theme
    Job_app[:theme]= newdata
  elsif selection == :numchildren
    Job_app[:numchildren]= newdata
  elsif selection == :budget
    Job_app[:budget]= newdata
  elsif selection == :urgency
    Job_app[:urgency]= newbool
  end
else
  puts "Thank you"
end

puts Job_app
end