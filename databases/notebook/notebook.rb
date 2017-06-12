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
    recipe_body varchar(255)
  )
SQL


#create a table to hold notes
create_table_cmd_3 = <<-SQL
  CREATE TABLE IF NOT EXISTS notes(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    subject varchar(255),
    note_body varchar(255)
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

def note_add(title, subject, note, notebook)
  notebook.execute("INSERT INTO notes (title, subject, note_body) values (?,?,?)", [title, subject, note])
end

def recipe_add(name, ingredient, recipe, notebook)
  notebook.execute("INSERT INTO recipes (name, ingredient, recipe_body) values (?,?,?)", [name, ingredient, recipe])
end

#methods to edit entries
def phone_edit(name, phone_number, notebook)
  notebook.execute("update phonebook set phone_num=? where name=?", [phone_number, name])
end

def note_edit(title, subject, note, notebook)
  notebook.execute("update notes set subject=?, note_body=? where title=?", [subject, note, title])
end

def recipe_edit(name, ingredient, recipe, notebook)
  notebook.execute("update recipes set ingredient=?, recipe_body=? where name=?", [ingredient, recipe, name])
end

#methods to delete entries
def phone_delete(name, notebook)
  notebook.execute("delete from phonebook where name=?", [name])
end

def note_delete(title, notebook)
  notebook.execute("delete from notes where title=?", [title])
end

def recipe_delete(name, notebook)
  notebook.execute("delete from recipes where name=?", [name])
end


phone_add("Steven", 5555555555, notebook)
note_add("paragraph tags", "html"," p tags or paragraph tags are inline elements", notebook)
recipe_add("grilled chicken", "chicken", "put chicken on a grill with a little bit of oil. Salt and pepper to taste", notebook)
phone_edit("Steven", 6666666666, notebook)
note_edit("paragraph tags", "html"," <p> tags or paragraph tags are inline elements", notebook)
recipe_edit("grilled chicken", "chicken breast", "put chicken on a grill with a little bit of oil. Salt and pepper to taste after done cooking", notebook)
note_delete("paragraph tags", notebook)



notes = notebook.execute("select * from notes")
notes.each do |k|
  puts "the #{k['title']} is #{k['note_body']}"
end


















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