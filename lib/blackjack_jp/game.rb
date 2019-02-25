require 'blackjack_jp/deck'
require 'blackjack_jp/person'

module BlackjackJp
  module Game
    def self.start
      init
      p 'ゲームスタート'
      @dealer.draw(2)
      @player.draw(2)
      puts "ディーラーの1枚目の手札は#{@dealer.hand[0]}です。"
      puts "#{@player.name}の手札は#{@player.hand}です。点数は#{get_point(@player.hand)}です。"
      player_turn
      dealer_turn
      duel
      replay
    end

    private

    class << self

      def player_turn
        puts "1: ヒット, 2: スタンド"
        flag = gets.chomp
        if flag == '1'
          puts 'ヒットしました。'
          puts "#{@player.name}#{@player.draw.last}を引きました。点数は#{get_point(@player.hand)}です。"
          judge(get_point(@player.hand))
          player_turn
        elsif flag == '2'
          puts 'スタンドしました。'
        else
          puts '不正な入力です'
          player_turn
        end
      end

      def dealer_turn
        @dealer_turn = true
        puts 'ディーラ-のターンです。'
        puts "ディーラーの手札は#{@dealer.hand}で#{get_point(@dealer.hand)}点です。"
        judge(get_point(@dealer.hand))
        dealer_draw
        puts "ディーラーの点数は#{get_point(@dealer.hand)}です。"
      end

      def get_point(hands)
        point = 0
        converted_hands = convert_face_card_to_int(hands)
        converted_hands.each do |hand|
          point += hand[0].to_i
        end
        point
      end

      def convert_face_card_to_int(hands)
        hands.each_with_index do |hand, index|
          card_number = hand[0]
          if card_number == 'J' || card_number == 'Q' || card_number == 'K'
            hands[index][0] = '10'
          end
        end
        hands
      end

      def judge(point)
        bursted if point > 21
        point
      end

      def dealer_draw
        if 17 >= get_point(@dealer.hand)
          puts "ディーラーは#{@dealer.draw}を引きました。点数は#{get_point(@dealer.hand)}点です。"
          judge(get_point(@dealer.hand))
        end
      end

      def duel
        if get_point(@dealer.hand) > get_point(@player.hand)
          puts 'ディーラーの勝利です。'
        elsif get_point(@dealer.hand) < get_point(@player.hand)
          puts "#{@player.name}の勝利です。"
        else
          puts '引き分けです。'
        end
      end

      def replay
        puts 'もう一度遊びますか？'
        puts '1: 遊ぶ, その他: 終わる'
        gets.chomp == '1' ? start : 'また遊んでね！'
      end

      def init
        deck = BlackjackJp::Deck.new.deck
        @dealer = BlackjackJp::Person.new('ディーラー', deck)
        puts "あなたの名前を入力してください。"
        name = gets.chomp
        @player = BlackjackJp::Person.new(name, deck)
        @dealer_turn = false
      end

      def bursted
        puts "バーストしました。"
        puts @dealer_turn == false ? "#{@player.name}の負けです。" : "ディーラーの負けです。"
        exit
      end

    end
  end
end
