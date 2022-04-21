require "rspec"
require "tower"

describe Tower do
  context "Initialize" do
    let(:tower) {Tower.new}
    it "should make a board" do
      expect {tower.board}.not_to raise_error
    end

    it "should make a brand new game" do
      expect(tower.board).to eq([
        [1, 2, 3],
        [:x, :x, :x],
        [:x, :x, :x]
      ])
    end
  end

  context "Move" do
    let(:tower) {Tower.new}
    it "should allow moves to be made" do
      tower.move([0, 2])
      expect(tower.board).to eq([
        [:x, 2, 3],
        [:x, :x, :x],
        [:x, :x, 1]
      ])
    end
  end

  context "Valid Move" do
    let (:tower) {Tower.new}
    it "should return true" do
      expect(tower.valid_move?([0,2])).to eq(true)
    end

    it "should raise error if column is empty" do
      expect {tower.valid_move?([1,2])}.to raise_error("No piece in selected column!")
    end
  end

  context "Winner?" do
    let (:wontower) {Tower.new}
    it "should return a win" do
      wontower.move([0, 2])
      wontower.move([0, 1])
      wontower.move([2, 1])
      wontower.move([0, 2])
      wontower.move([1, 0])
      wontower.move([1, 2])
      wontower.move([0, 2])
      expect(wontower.win?).to eq(true)
    end
  end
end