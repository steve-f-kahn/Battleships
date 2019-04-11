require_relative "board"
require_relative "display"
class Game
  attr_reader :player1board, :player2board
  def initialize
    @player1board = Board.new
    @player2board = Board.new
  end
  def place(player, order)
    player == 1 ? @player1board.place(order) : @player2board.place(order)
  end

  def showboards
    Display.boards(@player1board, @player2board)
  end
end
