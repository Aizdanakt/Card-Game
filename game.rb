# frozen_string_literal: true

require_relative 'player'
require_relative 'user'
require_relative 'card'
require_relative 'dealer'
require_relative 'deck'

class Game
  attr_reader :user, :dealer, :balance

  def initialize(name)
    @user = User.new(name)
    @dealer = Dealer.new('Mike')
    @card = Card.new
  end

  def new_game
    @deck = Deck.new
  end

  def preparing_game
    2.times do
      @user.cards << @deck.take_card
      @dealer.cards << @deck.take_card
    end
    puts "Ваши карты: #{@user.cards.join(' ')}"
    puts 'Карты диллера: * *'
    @user.count_points(@card.take_value_of_cards(@user.cards))
    @dealer.count_points(@card.take_value_of_cards(@dealer.cards))
    puts "У вас #{@user.points} очков"
    @user.make_bet
    @dealer.make_bet
  end

  def users_move
    choice = @user.make_move
    case choice
    when 1
      @user.cards << @deck.take_card
      puts "Ваши карты: #{@user.cards.join(' ')}"
      @user.count_card_points(@card.take_value_of_cards(@user.cards[-1]))
      puts "У вас #{@user.points} очков"
      @user.player_actions.delete('1 - Вы можете добавить карту')
      dealers_move
    when 2
      @user.player_actions.delete('2 - Вы можете пропустить ход')
      puts 'Вы пропустили ход'
      puts 'Диллер делает свой ход'
      sleep 3
      dealers_move
    when 3
      puts 'Игра завершена'
      finish_game
    end
  end

  def dealers_move
    case @dealer.dealer_move
    when 'add'
      @dealer.cards << @deck.take_card
      @dealer.count_card_points(@card.take_value_of_cards(@dealer.cards[-1]))
      puts 'Диллер взял карту'
      @dealer.player_actions.delete('1 - Вы можете добавить карту')
      finish_game if @user.cards.size == 3
    when 'skip'
      puts 'Диллер пропустил ход'
      @dealer.player_actions.delete('2 - Вы можете пропустить ход')
      users_move
    when 'finish'
      puts 'Игра завершена'
      finish_game
    end
  end

  def finish_game
    puts '_______________________________________'
    puts "Ваши карты: #{@user.cards.join(' ')}"
    puts "Карты диллера: #{@dealer.cards.join(' ')}"
    puts "У вас #{@user.points} очков"
    puts "У диллера #{@dealer.points} очков"
    if @user.points > @dealer.points && @user.points <= 21
      @user.player_win
      @dealer.player_loss
      puts "Поздравляем, вы выиграли! Теперь у вас $#{@user.balance}"
    elsif (@user.points == @dealer.points) || (@user.points > 21 && @dealer.points > 21)
      @user.draw_game
      @dealer.draw_game
      puts 'Вы сыграли в ничью!. Ваша ставка возвращается'
    elsif @user.points <= 21 && @dealer.points > 21
      @user.player_win
      @dealer.player_loss
      puts "Поздравляем, вы выиграли! Теперь у вас $#{@user.balance}"
    else
      @user.player_loss
      @dealer.player_win
      puts "К сожалению, вы проигралию. Теперь у вас $#{@user.balance}"
    end
    'finish'
  end
end
