{WorkspaceView} = require 'atom'
JapaneseZenHanConvert = require '../lib/japanese-zen-han-convert'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "JapaneseZenHanConvert", ->
  activationPromise = null

  beforeEach ->
    atom.workspace = new WorkspaceView
    activationPromise = atom.packages.activatePackage('japanese-zen-han-convert')

  describe "when the japanese-zen-han-convert:toHan event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspace.find('.japanese-zen-han-convert')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspace.element, 'japanese-zen-han-convert:toHan'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspace.find('.japanese-zen-han-convert')).toExist()
        atom.commands.dispatch atom.workspace.element, 'japanese-zen-han-convert:toHan'
        expect(atom.workspace.find('.japanese-zen-han-convert')).not.toExist()
