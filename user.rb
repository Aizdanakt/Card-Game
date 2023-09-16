class User < Player

  def initialize(name)
    super
  end

  def make_move
    puts 'Введите цифру возле нужного вам действия'
    puts @player_actions
    gets.chomp.to_i
  end
end
