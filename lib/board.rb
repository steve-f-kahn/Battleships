class Board
  CORDS = ("A"..."J").to_a
  def initialize
    @sea = [["o","o","o","o","o","o","o","o","o","o"]]
    9.times {@sea << ["o","o","o","o","o","o","o","o","o","o"]}
  end

  def place(order)
    order = {start: order.split("-")[0], finish: order.split("-")[1]}
    i = (CORDS.index(order[:finish][0]) - CORDS.index(order[:start][0]))
    while i >= 0 do
      j = order[:finish].slice(1..2).to_i - order[:start].slice(1..2).to_i
      while j >= 0 do
        if @sea[i + CORDS.index(order[:start][0])][j + order[:start].slice(1..2).to_i - 1] == "o"
          @sea[i + CORDS.index(order[:start][0])][j + order[:start].slice(1..2).to_i - 1] = "X"
        else
          return nil
        end
        j -= 1
      end
      i -= 1
    end
    @sea
  end

  def fire(cord)
    case @sea[CORDS.index(cord[0])][cord.slice(1..2).to_i]
    when "X"
      @sea[CORDS.index(cord[0])][cord.slice(1..2).to_i] = "S"
      puts "Hit!"
    when "S"
      puts "Already Hit!"
    when "o"
      puts "Miss!"
    end
  end

  def sea
    @sea
  end

end
