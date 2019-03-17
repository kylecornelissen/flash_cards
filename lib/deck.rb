class Deck

  attr_reader :cards

#initialize deck class
  def initialize(cards_arg)
    @cards = cards_arg
  end

#create a method that counts the cards in the deck class
  def count
    @cards.count
  end
#create a method that will tell you what cards in a category
  def cards_in_category(category_arg)

    @cards.find_all do |card|
      card.category == category_arg
    end

  end

end
