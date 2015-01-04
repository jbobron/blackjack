class window.Hand extends Backbone.Collection
  model: Card


  initialize: (array, @deck, @isDealer, @firstDeal) ->
    @.on 'checkBlackJack', ->
      @checkBlackJack()
      @
    @

  hit: ->
    @firstDeal = false;
    @add(@deck.pop())
    if @checkBusted()
      if @isDealer
        @win()
      else
        @lose()


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

  stand: -> #pass in players score
    console.log("inside stand")
    @trigger 'stand', @



  playToWin: ()->
    console.log("hello")
    @first().flip()
    busted = false
    while @findScore() < 16
      @hit()
      if @checkBusted()
        busted = true
    if !busted
      @trigger 'stand2'
    @

  dealerBust: ->
    @win()

  playerBust: ->
    @lose()

  checkBusted: ->
    if @findScore() > 21
      return true
    else
      return false



  win: ->
    setTimeout(->
      alert("YOU WIN!")
    ,500)


  lose: ->
    setTimeout(->
      alert("YOU LOSE!")
    ,500)

  findScore: ->
    if @hasAce()
      if @scores()[1] > 21
        return @scores()[0]
      else
        return @scores()[1]
    else
      return @scores()[0]

  checkBlackJack: ->
    if(@firstDeal and @findScore() == 21)
      alert("BLACKJACK!!!");
      @




