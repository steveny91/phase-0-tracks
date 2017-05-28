# Method to print a list and make it look pretty
# input: list
  # steps: go through list and print out item name with quantity and 
  # fluff text to make it look presentable
# output: "You will need to purchase: quantity of item, etc"

def pretty_list(list)
  list.each { |item_name, item_quantity|
    puts "You will need to purchase #{item_quantity} of #{item_name}."
  }
end

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # separate each individual item
  # set default quantity equal to 1
  # print the list to the console, call print list method
# output: hash, key: items, value: quantity

def create_list(items)
  item_list = {}
  item_array = items.split(" ")
  default_quantity = 1
  item_array.each do |item|
    item_list[item] = default_quantity
  end
  pretty_list(item_list) 
end

shopping_list = create_list("carrots apples cereal pizza")

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: add key: item to list; 
  # if value: quantity is present, then update 
  # if not, default to default
# output: updated hash with new key: items and value: quantity

def add_to_list(list, item, quantity = 1)
  list[item] = quantity
end

add_to_list(shopping_list, "lemonade", 2)
add_to_list(shopping_list, "tomatoes", 3)
add_to_list(shopping_list, "onions")
add_to_list(shopping_list, "ice cream", 4)

# Method to remove an item from the list
# input: item that we want to remove from the list, list
  # steps: search inside list for item name, delete item name
# output: updated list with item removed

def remove_from_list(list, item)
  list.delete(item)
end

remove_from_list(shopping_list, "lemonade")

# Method to update the quantity of an item
# input: list, key: item, value: quantity
  # steps: go through list, find key: item, update value: quantity
# output: updated list with value: quantity updated for item 

def update_quantity(list, item, quantity)
  add_to_list(list, item, quantity)
end

update_quantity(shopping_list, "ice cream", 1)

pretty_list(shopping_list)


=begin
From this challenge I learned that having a good pseudocode makes coding a lot faster. Especially having a input and an output really helps clarifies somethings for me.

Hashes have the advantage that you can save things in pairs. For example this challenge have we could save things in item: quantity. While an array I guess we could have access to methods not available for hashes such as the .map.

It returns the last returnable line or if whatever we declare for it to return with the return command

integers, hash, arrays, strings

We can save informations under variables and use that variables to pass on to other methods. We can also call methods inside of methods and give the information to it that way.

For me the whole aspect of what gets returned and how the scope of return values got a bit clarified.
  
=end