class Array
  def my_uniq
    result = Hash.new(0)
    self.each { |el| result[el] += 1 }
    result.keys
  end

  def two_sum
    raise ArgumentError if !self.is_a?(Array)
    pairs = []
    num_index = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |num, idx|
      if num_index.keys.include?(-num)
        pairs << [num_index[-num].first, idx]
      else
        num_index[num] << idx
      end
    end
    pairs.reverse
  end
end

def my_transpose(arr)
  transpose = Array.new(arr.length) {Array.new(arr.length)}
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      transpose[j][i] = arr[i][j]
    end
  end
  transpose
end

def stock_picker(arr)
  max_profit = 0
  pairs = []
  lowest = arr.first
  arr.each_with_index do |num, idx|
    lowest = num if num < lowest
    if num - lowest > max_profit
      pairs = [arr.index(lowest), idx]
    end
  end
  pairs
end

# p [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]

# p [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]

# p my_transpose(
#     [[0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]

#  p stock_picker([7,1,5,3,6,4]) # => [1, 5]