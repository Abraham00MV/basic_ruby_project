
class Mastermind < IndexError
  def initialize
    @secret_code = generate_secret_code
    @attempts = 0
  end

  def play
    puts '¡Welcome to  Mastermind!'
    puts 'Guess the code of colors of 4 positions.'
    puts 'Available colors: R (red), G (green), B (blue), Y (yellow), O (orange) y P (pink).'

    until game_over?
      puts "attempt #{@attempts + 1}:"
      guess = obtain_guess_guess
      result = check_guess(guess)
      display_result(result)
      @attempts += 1
    end

    if @attempts < 12
      puts "¡Winnner! you guess code in #{@attempts} attemps."
    else
      puts "¡You lost! You dont have more attempts. The code was: #{@secret_code.join}"
    end
  end

  private

  def generate_secret_code
    colors = %w[R G B Y O P]
    code = []
    4.times { code << colors.sample }
    code
  end
  # This method takes user input for the answer and handles errors.
  def obtain_guess
    restart_process = true
    print 'Put your guess (ejemplo: RGBY): '
    while restart_process
      restart_process = false
      begin
        guess = gets.chomp.upcase
        return guess.chars if valid_guess?(guess)
      rescue IndexError => e
        puts " #{e} : Enter the right colors. Use only the letters R, G, B, Y, O & P."
        restart_process = true
      end
    end
  end

  def valid_guess?(guess)
    return true if guess.match?(/^[RGBYOP]{4}$/)

    error_detected('invalid guess.')
  end

  def check_guess(guess)
    result = []
    guess.each_with_index do |color, index|
      if color == @secret_code[index]
        result[index] = 'O'
      elsif @secret_code.include?(color)
        result[index] = 'X'
      end
    end
    result.compact
  end

  def display_result(result)
    puts "Result: #{result.join}"
  end

  def game_over?
    @attempts >= 12 || @secret_code == @guess
  end
end