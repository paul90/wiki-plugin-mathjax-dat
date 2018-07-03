###
 * Federated Wiki : Mathjax Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/fedwiki/wiki-plugin-mathjax/blob/master/LICENSE.txt
###

window.plugins.mathjax =
  emit: (div, item) ->
    typeset = ->
      window.MathJax.Hub.Queue ["Typeset", MathJax.Hub]

    pluginOrigin = new URL(wiki.pluginRoutes["mathjax"])
    scriptURL = pluginOrigin + '/client/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
    wiki.getScript scriptURL, typeset
    div.append "<p>#{wiki.resolveLinks(item.text)}</p>"

  bind: (div, item) ->
    typeset = ->
      window.MathJax.Hub.Queue ["Typeset", MathJax.Hub, div.get(0)]

    pluginOrigin = new URL(wiki.pluginRoutes["mathjax"])
    scriptURL = pluginOrigin + '/client/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
    wiki.getScript scriptURL, typeset
    div.dblclick -> wiki.textEditor div, item
