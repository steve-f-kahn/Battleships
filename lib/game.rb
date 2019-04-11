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
      break if turn(1).nil?
      break if turn(2).nil?
    end
    showboards()
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
      getorder(@go)
    end
  end

  def turn(num)
    @go = num
    p "2nd go" if @go == 2
    getorder(num)
    return nil if @order == "show boards"
    if place(num, @order).nil?
      puts "Ship overlaps with another ship"
      turn(@go)
    end
    return "something"
  end
end
