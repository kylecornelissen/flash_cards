class Turn

  attr_reader :guess,
              :card
    #all attr_reader are initialized variables only

  def initialize(guess_arg, card_arg)
    @guess  = guess_arg
    @card   = card_arg

    #all initialized variables should be instance variables
  end

  def correct?
    if guess == card.answer
      true
    else
      false
    end

  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end

  end

end
