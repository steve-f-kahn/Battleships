class Display
  def self.boards(player1, player2)
    puts "Player 1s board"
    puts Display.new.format(player1)
    puts "Player 2s board"
    puts Display.new.format(player2)
  end

  def format(board)
    i = 0
    board.sea.each do |row|
       board.sea[i] = row.join(",")
       i += 1
    end
    board.sea.join("\n")
  end
end
