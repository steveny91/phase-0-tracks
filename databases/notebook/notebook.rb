require 'sqlite3'

######Database creation######
notebook = SQLite3::Database.new("notebook.db")
notebook.results_as_hash = true

#######Table creation#######
#create a table to hold name and phone numbers
create_table_cmd_1 = <<-SQL
  CREATE TABLE IF NOT EXISTS phonebook(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    phone_num int
  )
SQL


#create a table to hold recipes
create_table_cmd_2 = <<-SQL
  CREATE TABLE IF NOT EXISTS recipes(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    ingredient varchar(255),
    body varchar(255)
  )
SQL


#create a table to hold notes
create_table_cmd_3 = <<-SQL
  CREATE TABLE IF NOT EXISTS notes(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    subject varchar(255),
    body varchar(255)
  )
SQL


#Creation of the tables
notebook.execute(create_table_cmd_1)
notebook.execute(create_table_cmd_2)
notebook.execute(create_table_cmd_3)











#methods
#add to tables
def phone_add(name, phone_number, notebook)
  notebook.execute("INSERT INTO phonebook (name, phone_num) VALUES (?, ?)", [name, phone_number])
end

def note_add(name, subject, note, notebook)
  notebook.execute("INSERT INTO notes (name, subject, body) values (?,?,?)", [name, subject, note])
end

def recipe_add(name, ingredient, recipe, notebook)
  notebook.execute("INSERT INTO recipes (name, ingredient, body) values (?,?,?)", [name, ingredient, recipe])
end

#methods to edit entries
def phone_edit(name, phone_number, notebook)
  notebook.execute("update phonebook set phone_num=? where name=?", [phone_number, name])
end

def note_edit(name, subject, note, notebook)
  notebook.execute("update notes set subject=?, body=? where name=?", [subject, note, name])
end

def recipe_edit(name, ingredient, recipe, notebook)
  notebook.execute("update recipes set ingredient=?, body=? where name=?", [ingredient, recipe, name])
end

#methods to delete entries
def phone_delete(name, notebook)
  notebook.execute("delete from phonebook where name=?", [name])
end

def note_delete(name, notebook)
  notebook.execute("delete from notes where name=?", [name])
end

def recipe_delete(name, notebook)
  notebook.execute("delete from recipes where name=?", [name])
end



phone_add("Steven", 5555555555, notebook)
phone_add("Steve", 5555555554, notebook)
phone_add("Stevie", 5555555556, notebook)
note_add("paragraph tags", "html"," p tags or paragraph tags are inline elements", notebook)
note_add("paragraph", "html"," p tags or paragraph tags are inline elements", notebook)
recipe_add("grilled chicken", "chicken", "put chicken on a grill with a little bit of oil. Salt and pepper to taste", notebook)
recipe_add("grilled chicken", "chicken", "put chicken on a grill with a little bit of oil", notebook)
phone_edit("Steven", 6666666666, notebook)
note_edit("paragraph tags", "html"," <p> tags or paragraph tags are inline elements", notebook)
recipe_edit("grilled chicken", "chicken breast", "put chicken on a grill with a little bit of oil. Salt and pepper to taste after done cooking", notebook)


#View data
puts "Which book do you want to view? (phonebook, notes, recipes)"
selection = gets.chomp.downcase

selected = notebook.execute("select * from #{selection}")

if selection == "phonebook"
  selected.each do |k|
    puts "#{k[1]}" 
    puts "#{k[2]}"
  end
elsif selection == "notes" or selection == "recipes"
  selected.each do |k|
    puts "#{k['name']}" 
    puts "#{k['body']}"
  end
else
  puts "bad selection"
end

p selected


note_delete("paragraph tags", notebook)
recipe_delete("grilled chicken", notebook)
phone_delete("Steven", notebook)
















=begin
Code bits to set up a one to many relationship table using ingredients and subjects as foreign key


create_table_cmd_2 = <<-SQL
  CREATE TABLE IF NOT EXISTS ingredients(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
  )
SQL

create_table_cmd_2 = <<-SQL
  CREATE TABLE IF NOT EXISTS subjects(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
  )
SQL






######Generate a few examples of categories to populate table 2 and 4######
def ingredient_add(ingredient, notebook)
  notebook.execute("INSERT INTO ingredients (ingredient) VALUES (?)", [ingredient])
end

def subject_add(name, notebook)
  notebook.execute("INSERT INTO subjects (subject) VALUES (?)", [name])
end


ingredient_add("pork", notebook)
ingredient_add("chicken", notebook)
ingredient_add("beef", notebook)
subject_add("css", notebook)
subject_add("ruby", notebook)
subject_add("sql", notebook)
subject_add("html", notebook)

  
=end