puts "How many employees will be processed?"
employees = gets.chomp.to_i

def vampirecheck
  puts "What is your name?"
  name = gets.chomp

  puts "How old are you?"
  age = gets.chomp.to_i 

  puts "What year was that?"
  birthyear = gets.chomp.to_i 
  currentyear = 2017
  if currentyear - birthyear == age
    agecheck = TRUE
  else
    agecheck = FALSE
  end
    
  puts "Would you want some garlic bread?(yes/no)"
  garlic = gets.chomp
  if garlic == "yes" or garlic == "Yes"
    garlic = TRUE
  else
    garlic = FALSE
  end

  puts "Would you want to enroll for health insurance?(yes/no)"
  insurance = gets.chomp
  if insurance == "yes" or insurance == "Yes"
    insurance = TRUE
  else
    insurance = FALSE
  end

  puts "List any allergies you have"
  allergies = gets.chomp
  if allergies == "sunshine" || allergies == "none"
    allergiescheck = TRUE
  else
    allergiescheck = FALSE
  end

  while allergiescheck != TRUE do
    puts "anymore?"
    allergies = gets.chomp
    if allergies == "sunshine" or allergies == "done" or allergies == "no"
      break
    end
  end

  if name == "Drake Cula" or name == "Tu Fang" or allergies == "sunshine"
    puts "Clearly a vampire"
  elsif agecheck && garlic && insurance
    puts "Probably not a vampire"
  elsif agecheck != TRUE && garlic != TRUE && insurance != TRUE
    puts "Almost certainly a vampire"
  elsif agecheck != TRUE || garlic != TRUE || insurance != TRUE1
  
    puts "Probably a vampire."
  else
    puts "Results inconclusive"
  end
end  

=begin
alternative method
employees.times do
  vampirecheck
end 
=end

x = 0 
until x >= employees do
  vampirecheck
  x += 1 
end 



puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

