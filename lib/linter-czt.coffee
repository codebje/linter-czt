{Directory, CompositeDisposable} = require 'atom'

_os = null
path = null
helpers = null
voucher = null
fs = null
czt = null

module.exports =
  activate: (state) ->
    console.log("Enabled")
    @state = if state then state or {}
    require('atom-package-deps').install('linter-czt')
    @subscriptions = new CompositeDisposable
    @subscriptions.add(
      atom.config.observe 'linter-czt.javaExecutablePath',
        (newValue) =>
          @javaExecutablePath = newValue.trim()
    )

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
    return @state

  provideLinter: ->
    if _os == null
      _os = require 'os'
      path = require 'path'
      helpers = require 'atom-linter'
      #voucher = require 'voucher'
      fs = require 'fs'
      czt = path.join __dirname, "..", "czt", "czt.jar"
    console.log('providing linter')
    grammarScopes: ['text.tex.latex.zed']
    scope: 'file'
    lintOnFly: false  # Only on save
    lint: (textEditor) =>
      filePath = textEditor.getPath()
      args = ['-jar', czt, filePath]
      helpers.exec(@javaExecutablePath, args, {stream: undefined})
        .then (val) =>
          console.log('executed', args)
          @parse(val, textEditor)

  parse: (output, textEditor) ->
    # Parse any stderr failures first
    rWarnings  = /^WARNING: (.*)$/
    rSevere    = /^SEVERE: (.*)$/
    rException = /^Exception in .*: (.*)$/
    messages = []
    for line in output.stderr.split /\r?\n/
      if line.match rWarnings
        [message] = line.match(rWarnings)
        messages.push
          type: "warning"
          text: message
          filePath: textEditor.getPath()
      if line.match rSevere
        [message] = line.match(rSevere)
        messages.push
          type: "error"
          text: message
          filePath: textEditor.getPath()
      if line.match rException
        [message] = line.match(rException)
        messages.push
          type: "error"
          text: message
          filePath: textEditor.getPath()

    rMessage = /^(ERROR|WARNING) (.*?): (.*)$/
    for line in output.stdout.split /\r?\n/
      if line.match(rMessage)
        [typ, loc, message] = line.match(rMessage)[1..3]
        messages.push
          type: typ.toLowerCase()
          text: message
          filePath: textEditor.getPath()
          range: @getLocation(loc)
    return messages

  getLocation: (locString) ->
    rLineOnly = /^".*", line (\d+)$/
    rLineCol  = /^".*", line (\d+), column (\d+)$/
    rFullInfo = /^".*", line (\d+), column (\d+), length (\d+)$/
    if locString.match rLineOnly
      lineNo = locString.match(rLineOnly)[1]
      return [[lineNo*1,0], [lineNo*1,0]]
    if locString.match rLineCol
      [lineNo, colNo] = locString.match(rLineCol)[1..2]
      return [[lineNo*1, colNo*1], [lineNo*1, colNo*1]]
    if locString.match rFullInfo
      [lineNo, colNo, mLength] = locString.match(rFullInfo)[1..3]
      return [[lineNo*1, colNo*1], [lineNo*1, colNo*1 + mLength*1]]
    return [[0,0],[0,0]]
