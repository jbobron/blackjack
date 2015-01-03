class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  playerScore = 0

  hit: ->
    @add(@deck.pop())
    # playerScore +=

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  stand: (oppScore)-> #pass in players score
    console.log(oppScore)

    # flip dealer card over
    # check for dealer win
    # if no dealer win
    #   start dealer AI

  findScore: ->
    if @hasAce()
      if @scores()[1] > 21
        return @scores()[0]
      else
        return @scores()[1]
    else
      return @scores()[0]
    #   if second number > 21   return first number
    #   else return second number
    # else
    # return first number



