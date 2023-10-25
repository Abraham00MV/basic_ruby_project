require_relative 'TicTacToe'
require_relative 'Player'

class Board
  def initialize
  end

  def valid_move?(move) #method to determine if the current player makes a valid move
    @cells.include?(move)
  end

  def display_board #Method to show the board
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]}"
    puts "---+---+---"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]}"
    puts "---+---+---"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]}"
  end

  def make_move(move, symbol) #Method make the move of the current player
    #here index takes the index move and its assign to them
    index = @cells.index(move)
    @cells[index] = symbol # then its puts the symbol of the current player in the move position
  end

  def check_winner(symbol)
    # winning combinations contains all the combos to win the game
    winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    winning_combinations.any? { |combo| combo.all? { |i| @cells[i] == symbol } }
    #this validate if exits a match with the winner combos and make a comparison with actual board and the current player moves
  end

  def full? #This methods determine if exist a draw in the game
    @cells.all? { |cell| cell == "X" || cell == "O" }
  end
end