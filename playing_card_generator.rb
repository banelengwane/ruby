class Deck
  SUITS = ['s', 'h', 'd', 'c']
  VALUES = (2..10).map(&:to_s) + ['J', 'Q', 'K', 'A']
  
  def initialize
    @stack  = generate_stack
  end
  def draw
    @stack.pop
  end 

  def shuffle
    @stack.shuffle! 
  end

  private 
  def generate_stack
    VALUES.product(SUITS).map!(&:join)
    #stack = []
    #VALUES.each do |value|
    #  SUITS.each do |suit|
    #    stack << value + suit
    #  end 
    #end
  end  
end 

class Player
  def initialize
    @hand = []
  end
  
  def draw(card)
    @hand << card 
  end

  def peek_at_hand(player)
    reveal_hand
  end

  #stops other players from peeking hands of other players
  private
  
  def reveal_hand
    puts @hand
  end
end 

class Dealer 

  def initialize
    @deck = Deck.new 
  end
  
  def deal_card(player)
    player.draw(@deck.draw)
  end 

  def shuffle_deck
    @deck.shuffle
  end 

  def burn_card
    @deck.draw
  end 

  def open_pack
    @deck = Deck.new 
  end
end 

dealer = Dealer.new 
tara = Player.new
banele = Player.new
p dealer.shuffle_deck
p dealer.burn_card

#deal a card to Tara 5 times
5.times { dealer.deal_card(tara) }
p tara 
p dealer

#tara.reveal_hand
p tara.peek_at_hand(tara)
