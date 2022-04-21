require_relative 'card'

class Deck
    attr_accessor :deck
    SUITS = {
        'diamond' => '♦️',
        'club' => '♣️',
        'heart' => '♥️',
        'spade' => '♠️'
    }.freeze

    VALUES = {
        'A' => 14,
        'K' => 13,
        'Q' => 12,
        'J' => 11,
        '10' => 10,
        '9' => 9,
        '8' => 8,
        '7' => 7,
        '6' => 6,
        '5' => 5,
        '4' => 4,
        '3' => 3,
        '2' => 2
    }.freeze

    def initialize
        @deck = []
        populate
        @deck.shuffle!
    end

    def populate
        SUITS.each do |suit_k, suit_v|
            VALUES.each do |val_k, val_v|
                @deck << Card.new(suit_v, val_k)
            end
        end
    end

end