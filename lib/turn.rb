class Turn

  attr_reader :guess,
              :card,
              :answer


  def initialize(guess_arg, card_arg)
    @guess  = guess_arg
    @card   = card_arg
    correct = true
  end

  def correct?
    if guess == card.answer

      @correct = true
    else
      @correct = false
    end

  end

  def feedback
    if @correct == true
      "Correct!"
    else
      "Incorrect."
    end

  end

end
