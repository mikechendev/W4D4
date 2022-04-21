require_relative 'deck'
class Card < Deck
attr_reader :suit, :value

    def initialize(suit, value)
        @suit, @value = suit, value
        @reveal = @suit + @value
    end
    

end