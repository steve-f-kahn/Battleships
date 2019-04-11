require "board"

describe Board do
  it "returns an empty board when initialized" do
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
    expect(Board.new.sea).to eq sea
  end

  it "Can place a ship" do
    sea = [["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","X","o","o","o","o","o","o"],
           ["o","o","o","X","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"]]
    board = Board.new
    board.place("C4-D4")
    expect(board.sea).to eq sea
  end
end
