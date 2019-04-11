require "game"

describe "Setup a game and place a ship" do
  it "Can place a 4 long ship" do
    game = Game.new
    game.place(1,"B2-B5")
    sea = ["o,o,o,o,o,o,o,o,o,o\n"]
    sea.push("o,X,X,X,X,o,o,o,o,o\n")
    8.times { sea.push("o,o,o,o,o,o,o,o,o,o\n") }
    sea = sea.join("")
    expect{game.showboards}.to output(/#{sea}/).to_stdout
  end
end
