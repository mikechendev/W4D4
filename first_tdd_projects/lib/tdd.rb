class Array

    def my_uniq
        result = Hash.new(0)
        self.each { |el| result[el] += 1 }
        result.keys
    end

    def two_sum
        
    end

end

p [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
