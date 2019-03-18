class Round
  attr_reader :deck,
              :turns
# initialize method
  def initialize(deck_arg)
    @deck     = deck_arg
    @turns    = []

  end

  def current_card
    @deck.cards[0]
  end

# create method that inserts guess_arg into new turn object
  def take_turn(guess_arg)

    turn_obj = Turn.new(guess_arg, current_card)
    @turns << turn_obj

    (@deck.cards).delete_at(0)

    turn_obj
  end
# create method that counts number of correct questions
  def number_correct
    @correct_answers = []

    @turns.each do |turn|
      @correct_answers << turn.correct?
    end
    @correct_answers.count(true)
  end

# create method that counts number of correct questions when given a category
  def number_correct_by_category(category_arg)
    # correct_category = []
    #
    # @turns.each do {|turn|turn.card.category == category_arg}
    #
    #   correct_category << turn

    # end
    # correct_category.count

    # correct_guess = []

    # correct_guesses_in_category = @turns.each { |turn| turn.correct? && turn.card.category == category_arg}.count
    correct_guesses_in_category = []
    @turns.each do |turn|
      correct_guesses_in_category << turn if turn.correct? && turn.card.category == category_arg
    end
    correct_guesses_in_category.count

  end

  def percent_correct
    number_correct.to_f / @turns.count * 100
  end

  def percent_correct_by_category(category_arg)
    total_guesses_in_category = []
    @turns.each do |turn|
      total_guesses_in_category << turn if turn.card.category == category_arg
    end
    number_correct_by_category(category_arg).to_f / total_guesses_in_category.count * 100
  end

end
