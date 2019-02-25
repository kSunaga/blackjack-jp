require 'spec_helper'

RSpec.describe BlackjackJp do

  describe 'Card' do
    it 'カードのマークが合っている事' do
      mark = %w(♡ ♢ ♧ ♤)
      expect(BlackjackJp::Card.new.mark).to eq(mark)
    end
    it 'カードのナンバーが合っていること' do
      number = %w(1 2 3 4 5 6 7 8 9 10 J Q K)
      expect(BlackjackJp::Card.new.number).to eq(number)
    end
  end

  describe 'Deck' do
    it 'デッキが全52枚入っている事' do
      number_of_deck = 52
      expect(BlackjackJp::Deck.new.deck.count).to eq(number_of_deck)
    end
  end

  describe 'Person' do
    let(:deck) { BlackjackJp::Deck.new.deck }
    let(:name) { 'test_user' }
    let(:person) {BlackjackJp::Person.new(name, deck)}

    it 'ドローをするとデッキからカードが一枚減る事' do
      person.draw
      expect(person.deck.count).to eq(51)
    end
  end
end
