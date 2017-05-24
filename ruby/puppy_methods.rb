class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(integer)
    integer.times {
      puts "Woof!" 
    }
  end

  def roll_over 
    puts "Roll over"
  end

  def dog_years(age)
    puts age * 7 
  end

end

fido = Puppy.new
fido.fetch("ball")
fido.speak(5)
fido.roll_over
fido.dog_years(6)