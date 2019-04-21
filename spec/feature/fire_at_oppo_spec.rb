require 'game'
require_relative 'feature_helper'
describe "Fire at the opponent" do
  before(:each) do
  end
  it "After setup promts player 1 to fire" do
    game = setup()
    message = "Player 1 fire at will!"
    allow(STDIN).to receive(:gets).and_return("B01")
    expect{ game.start }.to output(/#{message}/).to_stdout
  end

  it "Player 1 fires and hits a target" do
    message = "Hit!"
    game = setup()
    allow(STDIN).to receive(:gets).and_return("B01")
    expect{ game.start }.to output(/#{message}/).to_stdout
  end
end
