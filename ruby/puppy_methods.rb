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

  def handshake 
    puts "Extends paw."
  end

  def initialize
    puts "Initializing new puppy instance..."
  end
end

fido = Puppy.new
fido.fetch("ball")
fido.speak(5)
fido.roll_over
fido.dog_years(6)
fido.handshake


#RELEASE 2
class Cafeteria
  
  def initialize
    puts "Customer enters cafeteria."
  end
  
  def eating(food)
    puts "Customer eats #{food}."
  end
  
  def drinking(drink)
    puts "Customer drinks #{drink}."
  end
end

customers = []
until customers.length == 50
  customers << Cafeteria.new 
end

customers.each {|customer| 
customer.eating("hotdog")
customer.drinking("soda")
}