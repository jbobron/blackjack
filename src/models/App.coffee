# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    debugger
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', @get('playerHand').playToWin, @get('dealerHand')
    @get('dealerHand').on 'stand2', @findWinner, @



    @

  findWinner: ->
     if @get('dealerHand').findScore() > @get('playerHand').findScore()
        console.log('in you lose')
        @get('playerHand').lose()
        @
      else if @get('playerHand').findScore() > @get('dealerHand').findScore()
        console.log('in you win')
        @get('playerHand').win()
        @
      else if @get('playerHand').findScore() == @get('dealerHand').findScore()
        alert("ITS A PUSH!!")
        @






  # playerEvents: (event, hand) ->
  #   switch event
  #     when 'bust'  then @trigger 'win-dealer'
  #     when 'stand' then @get('dealerHand').playToWin()







