require_relative 'board'
require_relative 'Player'

class TicTacToe

  def initialize
    @board = Board.new # Object asociation from Board class
    @player1 = Player.new("Player 1", "X") #Object asociation from Player class 
    @player2 = Player.new("Player 2", "O") #Object asociation from Player class
    @current_player = @player1 #Takes the player1 attribute to analize de movement
  end

  def play # game logic
    puts "¡Welcome to Tic-Tac-Toe!"
    @board.display_board #Show the board
    #board attribute value is an board object, and i can use board class methods
    loop do
      #string interpolation with current player attribute to show an ineractive message
      # (#name) & (#symbol) are attr_readers from Player class
      puts "#{@current_player.name}, is your turn (#{@current_player.symbol}):"
      move = gets.chomp.to_i #user input to make a movement in the board

      if @board.valid_move?(move) # flag to takes a board class method to determine if it is a valid move
        @board.make_move(move, @current_player.symbol) # put "x" or "o" in the user move value
        @board.display_board # shows the new board with user movement
           if @board.check_winner(@current_player.symbol) #flag to validate a player wins the game
           puts "#{@current_player.name} wins. ¡Congratulations!"
           break #break the loop when someone wins
           end
      end
      @current_player = (@current_player == @player1) ? @player2 : @player1
      puts "Invalid movement. Try again."

      if @board.full? #flag to break the game when its a draw
        puts "¡its a draw!"
        break #break the loop
      end
    end
  end
end

