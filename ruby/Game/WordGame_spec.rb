require_relative 'WordGame'

describe WordGame do
  let(:game) { WordGame.new("Unicorn") }

  it "collects the hidden word" do
    expect(game.word).to eq "unicorn"
  end

  it "calculates the number of chances based on the length of the word" do
    expect(game.chances).to eq 14
  end

  it "splits the letters apart" do
    expect(game.word_array).to eq ["u", "n", "i", "c", "o", "r", "n"]
  end

  it "converts the letters to _" do
    game.word_encrypter
    expect(game.secret_word).to eq ["_", "_", "_", "_", "_", "_", "_"]
  end

  it "if you guess the right word it will fill it in for you" do
    game.word_encrypter
    game.letter_checker("u")
    expect(game.secret_word).to eq ["u", "_", "_", "_", "_", "_", "_"]
  end

  it "it fills out nothing if the letter is incorrect" do
    game.word_encrypter
    expect(game.letter_checker("z")).to eq p "_ _ _ _ _ _ _"  
  end

  it "if you guess the whole word it can tell you if it's right or wrong" do
    game.word_encrypter
    expect(game.letter_checker("unicorn")).to eq true
  end

  it "keeps track of your old inputs" do
    game.word_encrypter
    game.letter_checker("z")
    game.letter_checker("x")
    expect(game.old_guess).to eq ["z", "x"]
  end

  it "only subtracts chances if the input hasn't been done before" do
    game.word_encrypter
    game.letter_checker("z")
    game.letter_checker("z")
    game.letter_checker("x")
    game.letter_checker("x")
    expect(game.chances).to eq 12
  end

  it "tells you when you lose" do
    game.word_encrypter
    game.letter_checker("z")
    game.letter_checker("y")
    game.letter_checker("x")
    game.letter_checker("v")
    game.letter_checker("za")
    game.letter_checker("ya")
    game.letter_checker("xa")
    game.letter_checker("va")
    game.letter_checker("zv")
    game.letter_checker("yv")
    game.letter_checker("xv")
    game.letter_checker("vv")
    game.letter_checker("dz")
    game.letter_checker("dd")
    expect(game.letter_checker("dy")).to eq true
  end

  it "tells you when you win by guessing" do
    game.word_encrypter
    game.letter_checker("u")
    game.letter_checker("n")
    game.letter_checker("i")
    game.letter_checker("c")
    game.letter_checker("o")
    game.letter_checker("r")
    expect(game.letter_checker("n")).to eq "True"
  end



end
