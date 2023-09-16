# frozen_string_literal: true

require_relative 'game'
require_relative 'round'
class Main

  def initialize
    @restart = Round.new
  end

  def start
    puts 'Добро пожаловать в RubyJack. Введите имя'
    black_jack = Game.new(gets.chomp)
    loop do
      @restart.game_over(black_jack) if black_jack.user.balance.zero? || black_jack.dealer.balance.zero?
      black_jack.new_game
      black_jack.preparing_game
      case black_jack.users_move
      when 'finish'
        choice = @restart.restart_game
      end
      break if choice == 1
    end
  end
end

a = Main.new
a.start
