# Title: Web Documentation
# Description: HTML Framework for writing web documentations/instructions.
# Version: 0.0.1
# Author: Vadim Goncharov (@owldesign)

#
# UNDERSCORE USAGE
# <%  %> - to execute some code
# <%= %> - to print some value in template
# <%- %> - to print some values with HTML escaped
#

class App
  init: =>
    styles = ["display: block","background: #f7cd81","color: white","padding: 20px 20px 20px 20px","text-align: center","font-weight: normal","font-size: 20px","line-height: 60px"].join(';')
    console.log '%c Web Documentation!', styles, 'Has loaded.'

    # Anchor Tag Scrolling
    scrollTo = (hash) ->
      location.hash = '#' + hash

    $(document).on 'click', '#sidebar a', (e) ->
      console.log e
      # scrollTo
      # $('html, body').animate { scrollTop: $('#theelementidtoscroll').offset().top }, 500

    # Setup Underscore Templates
    _.templateSettings.variable = "docs";
    pageTemplate = _.template($('#page-template').html())
    configTemplate = _.template($('#config-template').html())

    
    # navigationTemplate = _.template($('#navigation-template').html())
    # headerTemplate = _.template($('#header-template').html())
    # contentTemplate = _.template($('#content-template').html())
    
    # Load Config File
    # YAML.load '/config.yml', (result) ->
    #   $('#header').html(headerTemplate(result))
    #   $('.welcome-section h1').html result.welcome_message
    #   $('.welcome-section p').html result.welcome_copy


    # Build Navigation & Content
    $.ajax
      url: '/content.yml'
      success: (data) ->
        YAML.load '/content.yml', (content) ->
          $('#page-wrapper').html(pageTemplate(content))
          Prism.highlightAll() # ReInit code highlighting
        
        YAML.load '/config.yml', (config) ->
          $('#sidebar header').html(configTemplate(config))
          console.log config

      error: (error) ->
        console.log error




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