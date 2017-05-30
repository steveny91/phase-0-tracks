class WordGame
  attr_reader :word, :chances, :word_array, :secret_word, :old_guess, :game_over
  
  def initialize(word, chances = 20, secret_word = [], old_guess = [], game_over = FALSE)
    @word = word.downcase
    @word_array = @word.split('')
    @chances = chances - @word_array.uniq.length
    @secret_word = secret_word
    @old_guess = old_guess
    @game_over = game_over
    puts "you have #{@chances} chances to guess the word"
  end
  
=begin
  def letter_split
    @word_array = @word.split('')
  end
  
  def chance_calculator
    @chances = @chances - @word_array.uniq.length
    puts "You have #{@chances} chances to try"
  end
=end

  def word_encrypter
    @word_array.length.times {@secret_word << "_"}
    p @secret_word.join(' ')
  end
  
  #needs some refactoring if given the time. Code block looks really big. Might be better to split in some smaller methods?

  def letter_checker(letter)
    if @secret_word.include?("_") == FALSE or @word == letter
      p "Congratulations"
      @game_over = TRUE
    elsif chances == 0
      p "GAME OVER KID!"
      @game_over = TRUE
    elsif @word_array.include? (letter)
      @word_array.length.times {|index| 
        if @word_array[index] == letter
          @secret_word[index] = letter
        end
      }
      @secret_word[@word_array.index(letter)] = letter
      p @secret_word.join(' ')
        if @secret_word.include?("_") == FALSE or @word == letter
          p "Congratulations"
          @game_over = TRUE
        end
    elsif @old_guess.include? (letter)
      p "You tried that already"
    else
      @chances -= 1
      @old_guess << letter
      p "there is no #{letter} there's #{@chances} left"
      p @secret_word.join(' ')
    end
  end
  
end

###################################################################    
puts "please insert a word to start the game"
input = gets.chomp.downcase
puts "\e[H\e[2J"
game = WordGame.new(input)
game.word_encrypter



while game.game_over == FALSE
  puts "try to guess a letter or the whole word"
  letter = gets.chomp.downcase
  game.letter_checker(letter)
end






=begin
-Takes in a word as the word to be guessed
-Calculates the number of chances based on the length of the word
-Replace each letter with a "_"
-Print out the sequence of "_"
-Ask the player to guess a letter
-if correct replace the "_" at the right location with the letter
-if incorrect then chances will go down by 1
-if chances all get used up then loser message will appear
-if guessed all letters congratulations message will appear








secret_word = "unicorn"
arr = secret_word.split('')
secret = []
arr.length.times {secret << "_"}


p secret.join(" ")
wrong_choice = []
if arr.include?("z")
  secret[arr.index("z")] = "z"
else
  puts "no z"
  wrong_choice << "z"
end

p wrong_choice
  

p secret.join(" ")
=end
