require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

@card_1 = Card.new("Who played Harry Potter?", "Daniel Radcliffe", :Movies)
card_2 = Card.new("What is the capital of the USA? (Two Letters)", "DC", :Geography)
card_3 = Card.new("How many continents in the world?", "7", :Geography)
card_4 = Card.new("How many holes are there in a round of golf?", "18", :Sports)
card_5 = Card.new("What city hosted the 1996 Olympics?", "Atlanta", :Sports)
card_6 = Card.new("Who played Jack in Titanic?", "Leonardo Dicaprio", :Movies)
card_7 = Card.new("Who won the first Super Bowl?", "Green Bay Packers", :Sports)
card_8 = Card.new("What is the capital of Hawaii?", "Honolulu", :Geography)
card_9 = Card.new("What is the name of the bear in the Jungle Book?", "Baloo", :Movies)



deck_1 = Deck.new([@card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9])

round_1 = Round.new(deck_1)

round_1.start
