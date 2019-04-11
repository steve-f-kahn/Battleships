require "game"

describe Game do
  it "Returns an empty board when created" do
    sea = [["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"]]
    allow(Board).to receive(:new).and_return(sea)
    game = Game.new
    expect(game.player1board).to eq sea
  end

  it "Places a ship onto the board" do
    sea = [["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","X","X","X","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"]]
    game = Game.new
    game.place(1,"C03-C05")
    expect(game.player1board.sea).to eq(sea)
  end
end
