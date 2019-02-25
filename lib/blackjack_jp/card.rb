module BlackjackJp
  class Card
    attr_reader :mark, :number

    def initialize
      @mark = %w(♡ ♢ ♧ ♤)
      @number = %w(1 2 3 4 5 6 7 8 9 10 J Q K)
    end
  end
end
