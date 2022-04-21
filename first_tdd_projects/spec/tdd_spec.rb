require "tdd.rb"
require "rspec"

describe Array do
  context "Two_Sum" do
    it "finds sum pairs correctly" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end
