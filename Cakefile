sys = require 'sys'
exec = (require 'child_process').exec

FILENAME = 'puzzlelele'
FILES = [
    'src/main.coffee',
    'src/scene.coffee',
    'src/field.coffee',
    'src/panel.coffee',
    'src/position.coffee',
    'src/rectangle.coffee',
    'src/observer.coffee',
    'src/panel_manager.coffee',
    'src/connect.coffee'

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
