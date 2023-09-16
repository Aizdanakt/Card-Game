# frozen_string_literal: true

require_relative 'game'
# require_relative 'main'

class Round

  def restart_game
    puts '_________________________________'
    puts "Хотите сыграть еще раз?
              Если да - нажмите 0
              Если нет - нажмите 1 "
    gets.chomp.to_i
  end

  def game_over(black_jack)
    if black_jack.user.balance.zero?
      puts 'У вас не осталось денег на балансе! Хотите начать заново? Введите Да или Нет'
    else
      puts 'Поздравляю! Вы выиграли нашего диллера! Хотите сыграть еще раз? Введите Да или Нет'
    end
    choice = gets.chomp
    if choice == 'Да'
      a = Main.new
      a.start
    else
      puts 'Еще увидимся!'
    end
  end
end
