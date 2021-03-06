require "game"

describe "Setup a game and place ships" do
  it "Can place a 4 long ship" do
    allow(STDIN).to receive(:gets).and_return("B2-B5", "show boards")
    game = Game.new
    sea = ["o o o o o o o o o o\n"]
    sea.push("o X X X X o o o o o\n")
    8.times { sea.push("o o o o o o o o o o\n") }
    sea = sea.join("")
    expect{ game.setup }.to output(/#{sea}/).to_stdout
  end

  it "Lets player 2 place a ship after player 1" do
    allow(STDIN).to receive(:gets).and_return("B02-B05", "C02-C05", "show boards")
    game = Game.new
    sea = ["o o o o o o o o o o\n"]
    sea << "o o o o o o o o o o\n"
    sea << "o X X X X o o o o o\n"
    7.times { sea << "o o o o o o o o o o\n" }
    sea = sea.join("")
    expect{ game.setup }.to output(/#{sea}/).to_stdout
  end

  it "Tells the player to try again if ship is outside the board vertically" do
    allow(STDIN).to receive(:gets).and_return("Z01-Z03", "show boards")
    game = Game.new
    error = "Ship out of bounds place again"
    expect{ game.setup }.to output(/#{error}/).to_stdout
  end

  it "Tells the player to try again if ship is outside the board horizontally" do
    allow(STDIN).to receive(:gets).and_return("A11-A13", "show boards")
    game = Game.new
    error = "Ship out of bounds place again"
    expect{ game.setup }.to output(/#{error}/).to_stdout
  end

  it "Tells the player to try again if ship is outside the board horizontally" do
    allow(STDIN).to receive(:gets).and_return("A09-A12", "show boards")
    game = Game.new
    error = "Ship out of bounds place again"
    expect{ game.setup }.to output(/#{error}/).to_stdout
  end

  it "Trys to place a ship ontop of another ship and gets an error" do
    allow(STDIN).to receive(:gets).and_return("A01-A04", "A05-A09", "A01-A04", "show boards")
    game = Game.new
    error = "Ship overlaps with another ship"
    expect{ game.setup }.to output(/#{error}/).to_stdout
  end

  it "Trys to place a ship ontop of another ship and gets an error and can place a correct ship after" do
    allow(STDIN).to receive(:gets).and_return("A01-A04", "A05-A09", "A01-A04", "show boards")
    game = Game.new
    message = "Player 1 place your ship"
    expect{ game.setup }.to output(/#{message}/).to_stdout
  end
end
