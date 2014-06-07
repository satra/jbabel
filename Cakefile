{spawn, exec} = require 'child_process'

task 'build', 'Concatenate and compile', ->
  exec 'coffee --join lib/Image.js --compile src/*.coffee'
  exec 'coffee --join spec/ImageSpec.js --compile spec/ImageSpec.coffee'