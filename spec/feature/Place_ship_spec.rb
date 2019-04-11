require "game"

describe "Setup a game and place ships" do
  it "Can place a 4 long ship" do
    allow(STDIN).to receive(:gets).and_return("B2-B5", "show boards")
    game = Game.new
    sea = ["o o o o o o o o o o\n"]
    sea.push("o X X X X o o o o o\n")
    8.times { sea.push("o o o o o o o o o o\n") }
    sea = sea.join("")
    expect{ game.start }.to output(/#{sea}/).to_stdout
  end

  it "Lets player 2 place a ship after player 1" do
    allow(STDIN).to receive(:gets).and_return("B2-B5", "C2-C5", "show boards")
    game = Game.new
    sea = ["o o o o o o o o o o\n"]
    sea << "o o o o o o o o o o\n"
    sea << "o X X X X o o o o o\n"
    7.times { sea << "o o o o o o o o o o\n" }
    sea = sea.join("")
    expect{ game.start }.to output(/#{sea}/).to_stdout
  end

  it "Tells the player to try again if ship is outside the board" do
    allow(STDIN).to receive(:gets).and_return("Z1-Z3", "show boards")
    game = Game.new
    error = "Ship out of bounds place again"
    game.start
    # expect{ game.start }.to output(/#{error}/).to_stdout

  end
end
