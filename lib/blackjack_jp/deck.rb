require 'blackjack_jp/card'

module BlackjackJp
  class Deck
    attr_reader :deck

    def initialize
      marks = BlackjackJp::Card.new.mark
      numbers = BlackjackJp::Card.new.number
      @deck = make_deck(marks, numbers)
    end

    private

    def make_deck(marks, numbers)
      deck = []
      numbers.each do |n|
        marks.each do |m|
          deck.push [n, m]
        end
      end
      deck
    end
  end
end
