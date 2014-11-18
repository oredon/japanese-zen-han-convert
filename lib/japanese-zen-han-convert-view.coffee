module.exports =
class JapaneseZenHanConvertView
  constructor: (serializeState) ->
    # コマンド登録
    atom.commands.add 'atom-workspace', 'japanese-zen-han-convert:toHan': => @toHan()
    atom.commands.add 'atom-workspace', 'japanese-zen-han-convert:toZen': => @toZen()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  # Toggle the visibility of this view
  toHan: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?
    # get select text(string)
    selectedText = editor.getSelectedText()
    convertedText = selectedText.replace( /[Ａ-Ｚａ-ｚ０-９－！＃＄％＆（）＝＜＞，．？＿［］｛｝＠＾～]/g, (str) ->
        return String.fromCharCode(str.charCodeAt(0) - 65248)
    )

    editor.insertText(convertedText)

  toZen: ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?
    # get select text(string)
    selectedText = editor.getSelectedText()
    convertedText = selectedText.replace( /[A-Za-z0-9-!#$%&()=<>,.?_\[\]{}@^~]/g, (str) ->
        return String.fromCharCode(str.charCodeAt(0) + 65248)
    )

    editor.insertText(convertedText)
