require "tdd.rb"
require "rspec"

describe Array do
  let(:array) { [1, 2, 1, 3, 3] }

  describe "my_uniq" do
    it "finds unique values correctly" do
      expect(array.my_uniq).to eq([1, 2, 3])
    end
  end
  
  describe "two_sum" do
    it "finds sum pairs correctly" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "my_transpose" do
  it "transposes a matrix correctly" do
    matrix = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    expect(my_transpose(matrix)).to eq([
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9]
    ])
  end
end

describe "stock_picker" do
  let(:days) {[7,1,5,3,6,4]}
  it "should pick the right days to buy and sell" do
    expect(stock_picker(days)).to eq([1,5])
  end
end
