# Title: Web Documentation
# Description: HTML Framework for writing web documentations/instructions.
# Version: 0.0.1
# Author: Vadim Goncharov (@owldesign)

class App
  init: =>
    styles = ["display: block","background: #f7cd81","color: white","padding: 20px 20px 20px 20px","text-align: center","font-weight: normal","font-size: 20px","line-height: 60px"].join(';')
    console.log '%c Web Documentation!', styles, 'Has loaded.'
  
  # Tabs
  tabs: =>
    $("#tabs").tabulous effect: "scale"

  # Accordion
  accordion: =>
    # Sub Navigaiton Accordion
    $(".subnav").accordion
      speed: "fast"

    # Accordion
    $(".accordion").accordion
      speed: "fast"


$ ->
  Application = new App()
  Application.init()
  Application.tabs()
  Application.accordion()