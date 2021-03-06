###### General app to create notes and store notes. Can also function as phonebook ######
###### I'm sorry for whoever has to read this. The code is super repetitve as I didn't had the time to refactor ######

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



#create a table to hold notes
create_table_cmd_2 = <<-SQL
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



#methods
#View all data
def data_view(notebook, selection)
  selected = notebook.execute("select * from #{selection}")
  if selection == "phonebook"
    selected.each do |k|
      puts "Name: #{k[1]}" 
      puts "Phone Number: #{k[2]}"
    end
  elsif selection == "notes"
    selected.each do |k|
      puts "Title: #{k['name']}"
      puts "Subject: #{k['subject']}" 
      puts "Note: #{k['body']}"
    end
  else
    puts "bad selection"
  end
end



#add to tables
def phone_add(name, phone_number, notebook)
  notebook.execute("INSERT INTO phonebook (name, phone_num) VALUES (?, ?)", [name, phone_number])
end

def note_add(name, subject, note, notebook)
  notebook.execute("INSERT INTO notes (name, subject, body) values (?,?,?)", [name, subject, note])
end



#methods to edit entries
def phone_edit(name, phone_number, notebook)
  notebook.execute("update phonebook set phone_num=? where name=?", [phone_number, name])
end

def note_edit(name, subject, note, notebook)
  notebook.execute("update notes set subject=?, body=? where name=?", [subject, note, name])
end



#methods to delete entries
def phone_delete(name, notebook)
  notebook.execute("delete from phonebook where name=?", [name])
end

def note_delete(name, notebook)
  notebook.execute("delete from notes where name=?", [name])
end



#data deletion
def data_delete(access_table, name, notebook)
  if access_table == "phonebook"
    phone_delete(name, notebook)
  elsif access_table == "notes"
    note_delete(name, notebook)
  end
end



#method to collect the entry for multiline notes or multistep recipes and join them into one paragraph
def entry_loop
  puts "Type in the details (type done when finished)"
  entry_finished = FALSE
  entry_arr = []
  until entry_finished == TRUE do
    entry = gets.chomp.capitalize
    if entry == "Done"
      entry_finished = TRUE
    else
      entry_arr << entry
    end
  end
  entry = entry_arr.join(". ")
  return entry
end



#Driver code for random data entry to test codes
phone_add("Steven", 5555555555, notebook)
phone_add("Steve", 5555555554, notebook)
phone_add("Stevie", 5555555556, notebook)
phone_add("Stu", 4444444444, notebook)
phone_add("Stew", 4555555554, notebook)
phone_add("Stewie", 6555555556, notebook)
note_add("sql", "general info"," SQL Structured Query Language is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS).
", notebook)
note_add("html", "general info"," HyperText Markup Language (HTML) is a markup language for creating webpages. Webpages are usually viewed in a web browser. They can include writing, links, pictures, and even sound and video. HTML is used to mark and describe each of these kinds of content so the web browser can show them correctly.", notebook)

note_add("ruby", "commands"," #nill? tells us whether or not an object is empty in ruby. #length tell us how long the object is.", notebook)
note_add("css", "general info"," Cascading Style Sheets, or CSS, are a way to change the look of HTML and XHTML web pages. CSS was designed by the W3C, and is supported well by most modern web browsers. The current version of CSS is CSS3. CSS4 is available, but is split into parts.", notebook)



#big logic driver code to control interface.

quit = false
until quit == true do
  puts "Which option do you want to perform? (View, add, edit, delete or quit to exit)"
  perform_option = gets.chomp.downcase
  if perform_option == "view"
    puts "What book do you want to access? (Notes or Phonebook)"
    access = gets.chomp.downcase
    data_view(notebook, access)
  elsif perform_option == "add"
    puts "What book do you want to access? (Notes or Phonebook)"
    access = gets.chomp.downcase
    puts "what is the title/name"
    name = gets.chomp.capitalize
    if access == "notes"
      puts "what's the subject?"
      main_subject = gets.chomp.capitalize
      note_add(name, main_subject, entry_loop, notebook)
    elsif access == "phonebook"
      puts "what's the phone number?"
      main_subject = gets.chomp.capitalize
      phone_add(name, main_subject, notebook)
    else puts"wrong selection"
    end
    puts "noted"
  elsif perform_option == "edit"
    puts "What book do you want to access? (Notes or Phonebook)"
    access = gets.chomp.downcase
    puts "what is the title/name of the page you want to edit?"
    name = gets.chomp.capitalize
    if access == "notes"
      puts "what's the subject?"
      main_subject = gets.chomp.capitalize
      note_edit(name, main_subject, entry_loop, notebook)
    elsif access == "phonebook"
      puts "what's the new phone number?"
      main_subject = gets.chomp.capitalize
      phone_edit(name, main_subject, notebook)
    else puts"wrong selection"
    end
    puts "noted"
  elsif perform_option == "delete"
    puts "What book do you want to access? (Notes or Phonebook)"
    access = gets.chomp.downcase
    puts "What is the name/title of the page you want to delete?"
    name = gets.chomp.capitalize
    data_delete(access, name, notebook)
    puts "deleted"
  elsif perform_option == "quit"
    quit = true
  else
    puts "wrong selection"
  end
end













=begin
Code graveyard that I might revive if I have the time for it.

Search feature 

def data_view(notebook, selection, subject)
  if selection == "phonebook"
    selected = notebook.execute("select * from #{selection} where phonebook.name = #{subject}")
    selected.each do |k|
      puts "Name: #{k[1]}" 
      puts "Phone Number: #{k[2]}"
    end
  elsif selection == "notes"
    selected = notebook.execute("select * from #{selection} where notes.subject = #{subject}")
    selected.each do |k|
      puts "Title: #{k['name']}"
      puts "Subject: #{k['subject']}" 
      puts "Note: #{k['body']}"
  end
end




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

#create a table to hold recipes
create_table_cmd_2 = <<-SQL
  CREATE TABLE IF NOT EXISTS recipes(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    ingredient varchar(255),
    body varchar(255)
  )
SQL

def recipe_add(name, ingredient, recipe, notebook)
  notebook.execute("INSERT INTO recipes (name, ingredient, body) values (?,?,?)", [name, ingredient, recipe])
end
def recipe_edit(name, ingredient, recipe, notebook)
  notebook.execute("update recipes set ingredient=?, body=? where name=?", [ingredient, recipe, name])
end

def recipe_delete(name, notebook)
  notebook.execute("delete from recipes where name=?", [name])
end


recipe_add("grilled chicken", "chicken", "put chicken on a grill with a little bit of oil. Salt and pepper to taste", notebook)
recipe_add("grilled chicken", "chicken", "put chicken on a grill with a little bit of oil", notebook)

recipe_edit("grilled chicken", "chicken breast", "put chicken on a grill with a little bit of oil. Salt and pepper to taste after done cooking", notebook)

recipe_delete("grilled chicken", notebook)

 elsif access == "recipes"
      puts "what's the main ingredient?"
      main_subject = gets.chomp.capitalize
      recipe_add(name, main_subject, entry_loop, notebook)
elsif access == "recipes"
      puts "what's the main ingredient?"
      main_subject = gets.chomp.capitalize
      recipe_edit(name, main_subject, entry_loop, notebook)

def data_delete(access_table, name, notebook)
  if access_table == "phonebook"
    phone_delete(name, notebook)
  elsif access_table == "notes"
    note_delete(name, notebook)
  elsif access_table == "recipes" 
    recipe_delete(name, notebook)
  end
end


=end