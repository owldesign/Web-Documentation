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

    # FastClick for mobile
    FastClick.attach(document.body)

    # Navigation Trigger
    $('#menu-trigger').on 'click', (e) ->
      e.preventDefault()
      $(@).toggleClass 'active'
      $('body').toggleClass 'active'
      $('#content').toggleClass 'active'
      $('#sidebar').toggleClass 'active'

    # Setup Underscore Templates
    _.templateSettings.variable = "docs";
    pageTemplate = _.template($('#page-template').html())
    configTemplate = _.template($('#config-template').html())
    footerTemplate = _.template($('#footer-template').html())

    # Load Content & Config
    contentData = YAML.load '/content.yml'
    configData = YAML.load '/config.yml'

    $('#page-wrapper').html(pageTemplate(contentData)) # Load Content
    $('#header').html(configTemplate(configData)) # Load Page Info
    $('#footer').html(footerTemplate(configData)) # Load Footer Info

    # Navigation Accordion
    $('.subnav').accordion # Navigation Accordion
      speed: 'fast'

    # Scroll To Section
    $('.anchor').on 'click', (e) -> # Navigate to section id
      e.preventDefault()
      target = $(@).attr 'href'
      $('html, body').animate { scrollTop: $(target).offset().top - 25 }, 500
    
    # Fixed navigation
    nav = $('#sidebar nav').offset()
    console.log nav
    $(window).scroll ->
      if $(window).scrollTop() > nav.top + 35
        $('#sidebar nav').addClass 'fixed'
      else
        $('#sidebar nav').removeClass 'fixed'

$ ->
  Application = new App()
  Application.init()