
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name #Name of the player default
    @symbol = symbol #game symbol of the player
  end
end