class Display
  def self.boards(player1, player2)
    puts "Player 1s board"
    puts Display.new.format(player1)
    puts "Player 2s board"
    puts Display.new.format(player2)
  end

  def format(board)
    i = 0
    board.each do |row|
      p row
       board[i] = row.join(" ")
       i += 1
    end
    board.join("\n")
  end
end
