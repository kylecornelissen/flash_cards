require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_counts_the_cards_in_the_deck
    assert_equal 3, @deck.count
    refute_equal 7, @deck.count
  end

  def test_it_checks_card_categories
    assert_equal @cards = [@card_2, @card_3], @deck.cards_in_category(:STEM)
    assert_equal @cards = [@card_1], @deck.cards_in_category(:Geography)
    assert_equal @cards = [], @deck.cards_in_category("Pop Culture")
    refute_equal @cards = [@card1, @card2, @card3], @deck.cards_in_category(:Sports)
  end

end

# require './lib/card'
# require './lib/deck'
# card_1 = Card.new("Capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("Which planet?", "Mars", :STEM)
# card_3 = Card.new("Exact direction?", "North north west", :STEM)
# cards = [card_1, card_2, card_3]
# deck = Deck.new(cards)
# deck.cards
# deck.count
# deck.cards_in_category(:STEM)
# deck.cards_in_category(:Geography)
# deck.cards_in_category("Pop Culture")
