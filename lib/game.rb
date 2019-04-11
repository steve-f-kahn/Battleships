require_relative "board"
require_relative "display"
class Game
  attr_reader :player1board, :player2board
  def initialize
    @player1board = Board.new
    @player2board = Board.new
  end

  def start
    i = 0
    while i < 5
      turn(1)
      @order == "show boards" ? break : place(1, @order)
      turn(2)
      @order == "show boards" ? break : place(2, @order)
    end
    showboards() if @order == "show boards"
  end

  def place(player, order)
    player == 1 ? @player1board.place(order) : @player2board.place(order)
  end

  def showboards
    Display.boards(@player1board.sea, @player2board.sea)
  end

  def getorder(player)
    puts "Player #{player} place your ship"
    @order = STDIN.gets.chomp
    illegal?
  end

  def illegal?
    if @order.split("").any?(("K".."Z")) ||  @order.slice(1..2).to_i > 10 || @order.slice(5..6).to_i > 10
      puts "Ship out of bounds place again"
      getorder(1)
    end
  end

  def turn(num)
    puts "Player #{num} place your ship"
    getorder(num)
  end
end
