# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----
zombie_apocalypse_supplies.join(' * ')

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----
def array_sort(array)
  sorted = false
  cycle = array.length-1
  while sorted == false
    sorted = true
    cycle.times {|index|
      if array[index].downcase > array[index+1].downcase
        array[index], array[index+1] = array[index+1], array[index]
        sorted = false
      end
    }
  end  
  array
end

array_sort(zombie_apocalypse_supplies)

# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----

def lookup(array, item)
counter = 0
array.each {|x|
  if x == item
    return "yay"
  end
}
return "nay"
end

lookup(zombie_apocalypse_supplies, "boots")

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----
def remove(array, capacity)
  array.shuffle! #works without this, just added for a little experimenting
  toss = array[capacity..-1]
  backpack = array - toss
  return backpack
end

remove(zombie_apocalypse_supplies, 5)

#or

def remove(array, capacity)
  length = array.length - capacity
  if(length > 0)
    length.times {array.pop}
  end
  return array
end
remove(zombie_apocalypse_supplies, 5)

# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
def remove(array, array2)
  backpack1 = array - array2
  supplies = backpack1 + array2
  return supplies
end
#or 
p zombie_apocalypse_supplies.concat(other_survivor_supplies)

# ----

# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----
def combine(hash)
  array = []
  hash.each {|k,v| array.push("#{k} - #{v}")}
  array.join(" * ")
end

combine(extinct_animals)
# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----
def extinct(hash,year)
  hash.each {|k,v| 
    if v >= year
      hash.delete(k)
    end
}
end
  
p extinct(extinct_animals,2000)

# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----
def extinctyear(hash,year)
  hash.each {|k,v|
  newyear = v - year
  hash[k] = newyear
}
end
  
p extinctyear(extinct_animals,3)
# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----
def lookup(hash,animal)
  hash.each {|k,v|
  if k == animal
    return "yay"
  end
}
return "nay"
end
p lookup(extinct_animals,"Andean Cat")
p lookup(extinct_animals,"Dodo")
p lookup(extinct_animals,"Saiga Antelope")


# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----
p extinct_animals.select {|k,v| k == "Passenger Pigeon"}.to_a