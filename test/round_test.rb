require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test



  def test_it_exists
    
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)
    @round.deck
    @round.turns
    @round.current_card

    assert_instance_of Round, @round
  end

  def test_current_card_is_first_card

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)
    @round.deck
    @round.turns
    @round.current_card

    assert_equal @round.current_card, @card_1
  end

  def test_take_turn_method_will_take_turn

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)

    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_it_will_add_turn_object_to_turns_array

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)
    @round.deck
    @round.turns
    @round.current_card
    new_turn = @round.take_turn("Juneau")

    assert_equal @round.turns, [new_turn]
  end

  def test_number_correct_will_increase

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)

    new_turn = @round.take_turn("Juneau")



    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category_is_correct

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)

    new_turn = @round.take_turn("Juneau")
    new_turn2 = @round.take_turn("Venus")
    # new_turn3 = @round.take_turn("")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)

    new_turn = @round.take_turn("Juneau")
    new_turn2 = @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to earth photographs and reports about the surface of Which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5˚ clockwise form due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)

    new_turn = @round.take_turn("Juneau")
    new_turn2 = @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal 0.0, @round.percent_correct_by_category(:STEM)
  end

end

# require './lib/card'
# require './lib/deck'
# require './lib/round'
# require './lib/turn'
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# deck = Deck.new([card_1, card_2, card_3])
# round = Round.new(deck)

# round.deck
# round.turns
# round.current_card
# new_turn = round.take_turn("Juneau")
#
# new_turn.class
# new_turn.correct?
# round.turns
# round.number_correct
#
# round.current_card
# round.take_turn("Venus")
# round.turns.count
# round.turns.last.feedback
#
# round.number_correct
# round.number_correct_by_category(:Geography)
# round.number_correct_by_category(:STEM)
# round.percent_correct
# round.percent_correct_by_category(:Geography)
# round.current_card
