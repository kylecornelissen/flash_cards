class Round
  attr_reader :deck,
              :turns
#initialize method
  def initialize(deck_arg)
    @deck     = deck_arg
    @turns    = []

  end

  def current_card
    @deck.cards[0]
  end

#create method that inserts guess_arg into new turn object
  def take_turn(guess_arg)

    turn_obj = Turn.new(guess_arg, current_card)
    @turns << turn_obj

    (@deck.cards).delete_at(0)

    turn_obj
  end

  def number_correct
    correct_answers = []
    @turns.each do |turn|
      correct_answers << turn.correct? == true
    end
    correct_answers.count
  end


  def number_correct_by_category

  end






end