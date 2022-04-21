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
    pairs
  end
end


p [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]

p [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
