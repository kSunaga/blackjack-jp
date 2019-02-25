module BlackjackJp
  class Person
    attr_accessor :name, :deck, :hand

    def initialize(name, deck, hand=[])
      @name = name
      @deck = deck.shuffle
      @hand = hand
    end

    def draw(num = 1)
      @hand += @deck.shift(num)
    end
  end
end
