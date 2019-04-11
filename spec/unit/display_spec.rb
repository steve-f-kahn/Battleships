require "display"

describe Display do
  it "Formats a playyer board into a useable output" do
    boarddouble = double("A board")
    boarddouble2 = double("A differnet board")
    array = [["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"]]
  array2 = [["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"],
           ["o","o","o","o","o","o","o","o","o","o"]]
    allow(boarddouble).to receive(:sea).and_return(array)
    allow(boarddouble2).to receive(:sea).and_return(array2)
    sea = []
    10.times { sea.push("o,o,o,o,o,o,o,o,o,o\n") }
    sea.join("")
    expect{ Display.boards(boarddouble, boarddouble2) }.to output(/#{sea}/).to_stdout
  end
end
