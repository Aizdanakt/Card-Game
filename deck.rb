class Deck
  def initialize
    @cards = %w[2+ 3+ 4+ 5+ 6+ 7+ 8+ 9+ 10+ K+ Q+ J+ A+ 2<3 3<3 4<3 5<3 6<3 7<3 8<3 9<3 10<3 K<3 Q<3 J<3 A<3 2<> 3<>
             4<> 5<> 6<> 7<> 8<> 9<> 10<> K<> Q<> J<> A<> 2^ 3^ 4^ 5^ 6^ 7^ 8^ 9^ 10^ K^ Q^ J^ A^].shuffle
  end

  def take_card
    @cards.pop
  end
end
