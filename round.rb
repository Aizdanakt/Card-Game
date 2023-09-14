class Round
  def start_game

  end

  def restart_game
    puts "Хотите сыграть еще раз?
              Если да - нажмите 0
              Если нет - нажмите 1 "
    choice = gets.chomp.to_i
  end
end
