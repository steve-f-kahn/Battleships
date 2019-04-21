require "display"

describe Display do
  it "Formats a playyer board into a useable output" do
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
    sea = []
    10.times { sea.push("o o o o o o o o o o\n") }
    sea.join("")
    expect{ Display.boards(array, array2) }.to output(/#{sea}/).to_stdout
  end
end
