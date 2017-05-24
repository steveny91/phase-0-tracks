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


end

fido = Puppy.new
fido.fetch("ball")
fido.speak(5)