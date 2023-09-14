class Player
  attr_accessor :cards, :balance
  attr_reader :name, :points

  def initialize(name)
    @name = name
    @balance = 100
    @cards = []
    @points = 0
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

  def make_bet
    @balance -= 10
  end

  def draw_game
    @balance += 10
    @cards = []
  end

  def player_win
    @balance += 20
    @cards = []
  end

  def player_loss
    @balance -= 10
    @cards = []
  end


end
