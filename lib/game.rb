require_relative "board"
require_relative "display"
class Game
  attr_reader :player1board, :player2board
  def initialize
    @player1board = Board.new
    @player2board = Board.new
  end

  def start
    order = ""
    i = 0
    while i < 5 
      puts "Player 1 place your ship"
      order = STDIN.gets.chomp
      order == "show boards" ? break : place(1, order)
      puts "Player 2 place your ship"
      order = STDIN.gets.chomp
      order == "show boards" ? break : place(2, order)
      i += 1
    end
    showboards()
  end

  def place(player, order)
    player == 1 ? @player1board.place(order) : @player2board.place(order)
  end

  def showboards
    Display.boards(@player1board.sea, @player2board.sea)
  end
end
