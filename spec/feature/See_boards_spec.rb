require "game"

describe "Can see the board" do
  it "Shows the board is empty at the start" do
    game = Game.new
    sea = []
    10.times { sea.push("o,o,o,o,o,o,o,o,o,o\n") }
    sea.join("")
    expect{game.showboards}.to output(/#{sea}/).to_stdout
  end
end
