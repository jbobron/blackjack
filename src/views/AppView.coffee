class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').stand(@model.get('playerHand').findScore())
      # debugger;
      # console.log(@model.get('dealerHand').scores(),@model.get('dealerHand').scores());
      # while @model.get('dealerHand').scores() < 16
      #   console.log('inside while loop')
      #   @model.get('dealerHand').hit()
      # @model.get('dealerHand')


  initialize: ->

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

