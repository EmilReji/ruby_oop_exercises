class GuessingGame
  GUESSES = 7

  def initialize
    @num = generate_num
  end

  def play
    GUESSES.times do |i|
      puts "You have #{GUESSES - i} remaining."
      puts "Enter a number between 1 and 100:"
      guess = user_input
      if win?(guess)
        winning_output
        return
      end
      check_guess(guess)
    end
    losing_output
  end

  private

  def losing_output
    puts "You have no more guesses. You lost!"
    puts "The correct answer was: #{@num}"
  end

  def winning_output
    puts "That's the number!"
    puts
    puts "You won!"
  end

  def user_input
    guess = nil
    loop do
      guess = gets.chomp
      break if ('1'..'100').include?(guess)
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
    guess.to_i
  end

  def generate_num
    rand(1..100)
  end

  def check_guess(guess)
    if guess > @num
      puts "Your guess is too high."
    elsif guess < @num
      puts "Your guess is too low."
    end
  end

  def win?(guess)
    guess == @num
  end
end

game = GuessingGame.new
game.play
