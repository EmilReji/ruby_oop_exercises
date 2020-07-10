class GuessingGame
  def initialize(low = 1, high = 100)
    @low = low.to_i
    @high = high.to_i
    @guesses = Math.log2(@high - @low + 1).to_i + 1
    @num = generate_num
  end

  def play
    @guesses.times do |i|
      puts "You have #{@guesses - i} remaining."
      puts "Enter a number between #{@low} and #{@high}:"
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
      break if ("#{@low}".."#{@high}").include?(guess)
      puts "Invalid guess. Enter a number between #{@low} and #{@high}:"
    end
    guess.to_i
  end

  def generate_num
    rand(@low..@high)
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

game = GuessingGame.new(501, 1500)
game.play

