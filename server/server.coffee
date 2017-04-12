# mathjax plugin, server-side component
#
# adds a path for the client to load MathJax
# unused for now, see https://github.com/fedwiki/wiki-plugin-mathjax/pull/7

path = require 'path'
express = require 'express'

startServer = (params) ->
  app = params.app

  mathjaxLoc = require.resolve('mathjax')
  mathjaxPath = mathjaxLoc.substring(0, mathjaxLoc.lastIndexOf(path.sep))

  console.log "MathJax path = #{mathjaxPath}"

  app.use('/plugins/mathjax/mathjax', express.static(mathjaxPath))


module.exports = {startServer}
