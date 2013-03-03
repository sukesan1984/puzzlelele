sys = require 'sys'
exec = (require 'child_process').exec

FILENAME = 'puzzlelele'
FILES = [
    'src/main.coffee',
    'src/state.coffee',
    'src/scene.coffee',
    'src/Field.coffee'
]
HTMLFILE = 'index.html'

task 'compile', 'compile and minify Puzzlelele.', (options) ->
  outputErr = (err, stdout, stderr) ->
    throw err if err
    if stdout or stderr
      console.log "#{stdout} #{stderr}"
  if FILES.length is 1
    exec "coffee -c #{FILENAME}.js #{FILES[0]}", outputErr
  else
    exec "coffee -cj #{FILENAME} #{FILES.join ' '}", outputErr 
  exec "yuicompressor #{FILENAME}.js > #{FILENAME}.min.js", outputErr
