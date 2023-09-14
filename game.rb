require_relative 'player'
require_relative 'game'
require_relative 'user'
require_relative 'card'
require_relative 'dealer'
require_relative 'deck'

class Game

  def initialize(name)
    @user = User.new(name)
    @dealer = Dealer.new('Mike')
    @deck = Deck.new
  end

  private

  def preparing_game
    @user.cards << @deck.take_card(2)
    @dealer.cards << @deck.take_card(2)
    puts "Ваши карты: #{@user.cards.join(' ')}"
    puts "Карты диллера: #{@dealer.cards.map { |_| '*' }.join(' ')}"
    @user.count_points(@deck.take_card(@user.cards))
    @dealer.count_points(@deck.take_card(@dealer.cards))
    puts "У вас #{@user.points} очков"
    @user.make_bet
    @dealer.make_bet
  end

  def round_one

  end
end
