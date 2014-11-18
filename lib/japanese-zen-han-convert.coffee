JapaneseZenHanConvertView = require './japanese-zen-han-convert-view'

module.exports =
  japaneseZenHanConvertView: null

  activate: (state) ->
    @japaneseZenHanConvertView = new JapaneseZenHanConvertView(state.japaneseZenHanConvertViewState)

  deactivate: ->
    @japaneseZenHanConvertView.destroy()

  serialize: ->
    japaneseZenHanConvertViewState: @japaneseZenHanConvertView.serialize()
