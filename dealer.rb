class Dealer < Player
  def initialize(name)
    super
  end

  def dealer_move
    if @points >= 17 && @player_actions.include?('2 - Вы можете пропустить ход')
      'skip'
    elsif @points < 17 && @player_actions.include?('1 - Вы можете добавить карту')
      'add'
    else
      'finish'
    end
  end

end
