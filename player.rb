class Player
  attr_accessor :cards, :player_actions
  attr_reader :name, :points, :balance

  def initialize(name)
    @name = name
    @balance = 100
    @cards = []
    @points = 0
    @player_actions = ['1 - Вы можете добавить карту',
                       '2 - Вы можете пропустить ход',
                       '3 - Вы можете открыть карты']
  end

  def count_points(value_array)
    if value_array.include? [1, 11]
      if value_array.count([1, 11]) == 2
        @points = 2
      else
        value_array.each do |point|
          @points += point.class == Array ? point[1] : point
        end
      end
    else
      @points = value_array.sum
    end
  end

  def count_card_points(value_array)
    @points += if value_array.include? [1, 11]
                 (@points + 11) > 21 ? 1 : 11
               else
                 value_array.sum
               end
  end

  def make_bet
    @balance -= 10
  end

  def draw_game
    @balance += 10
    finish_game
  end

  def player_win
    @balance += 20
    finish_game
  end

  def player_loss
    finish_game
  end

  def finish_game
    @cards = []
    @points = 0
    @player_actions = ['1 - Вы можете добавить карту',
                       '2 - Вы можете пропустить ход',
                       '3 - Вы можете открыть карты']
  end


end
