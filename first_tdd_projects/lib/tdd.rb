class Array

    def my_uniq
        result = Hash.new(0)
        self.each { |el| result[el] += 1 }
        result.keys
    end

    def two_sum
        result = []
        (0...self.length-1).each do |i|
            (i+1...self.length).each do |j|
                result << [i,j] if self[i] + self[j] == 0
            end
        end
        result
    end

end

p [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]

p [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
