require 'sqlite3'

notebook = SQLite3::Database.new("notebook.db")

#create a table to hold name and phone numbers
create_table_cmd_1 = <<-SQL
  CREATE TABLE IF NOT EXISTS phonebook(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    phone_num int
  )
SQL

#Table 2 and 3 for cookbook recipes
create_table_cmd_2 = <<-SQL
  CREATE TABLE IF NOT EXISTS ingredients(
    id INTEGER PRIMARY KEY,
    ingredient VARCHAR(255)
  )
SQL

create_table_cmd_3 = <<-SQL
  CREATE TABLE IF NOT EXISTS recipes(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    main_ingredient_id int,
    phone_num int,
    foreign key (main_ingredient_id) references ingredients(id)
  )
SQL

#Table 4 and 5 for class/random notes
create_table_cmd_4 = <<-SQL
  CREATE TABLE IF NOT EXISTS subjects(
    id INTEGER PRIMARY KEY,
    subject VARCHAR(255)
  )
SQL

create_table_cmd_5 = <<-SQL
  CREATE TABLE IF NOT EXISTS notes(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    subject_id int,
    phone_num int,
    foreign key (subject_id) references subject(id)
  )
SQL

notebook.execute(create_table_cmd_1)

notebook.execute(create_table_cmd_2)

notebook.execute(create_table_cmd_3)
notebook.execute(create_table_cmd_4)
notebook.execute(create_table_cmd_5)



