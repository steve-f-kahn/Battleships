def setup
  game = Game.new
  allow(STDIN).to receive(:gets).and_return("A01-A05", "A01-A05", "B01-B03",
    "B01-B03", "C01-C03", "C01-C03", "D01-D03",
    "D01-D03", "E01-F01", "E01-F01", "N")
  game.setup
  return game
end
