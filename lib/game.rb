require_relative "board"
require_relative "display"
class Game
  attr_reader :player1board, :player2board
  def initialize
    @player1board = Board.new
    @player2board = Board.new
    @gameover = false
  end

  def setup
    i = 0
    while i < 5
      @attempt = 0
      break if placement_turn(1).nil?
      break if placement_turn(2).nil?
      i += 1
    end
     showboards() if @order == "show boards"
     start() if STDIN.gets.chomp == "Y"
  end

  def start
    while @gameover == false
      puts "Player 1 fire at will!"
      fire(1)
      break
    end
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

  def placement_turn(num)
    @go = num
    getorder(num)
    return nil if @order == "show boards"
    if place(num, @order).nil?
      puts "Ship overlaps with another ship"
      @attempt += 1
      return nil if @attempt > 10
      placement_turn(@go)
    end
    "something"
  end

  def fire(num)
    order = STDIN.gets.chomp
    num == 1 ? @player1board.fire(order) : @player1board.fire(order)
  end
end
