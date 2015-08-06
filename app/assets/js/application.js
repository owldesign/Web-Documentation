var App,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

App = (function() {
  function App() {
    this.init = bind(this.init, this);
  }

  App.prototype.init = function() {
    var configData, configTemplate, contentData, footerTemplate, nav, pageTemplate, styles;
    styles = ["display: block", "background: #f7cd81", "color: white", "padding: 20px 20px 20px 20px", "text-align: center", "font-weight: normal", "font-size: 20px", "line-height: 60px"].join(';');
    console.log('%c Web Documentation!', styles, 'Has loaded.');
    FastClick.attach(document.body);
    $('#menu-trigger').on('click', function(e) {
      e.preventDefault();
      $(this).toggleClass('active');
      $('body').toggleClass('active');
      $('#content').toggleClass('active');
      return $('#sidebar').toggleClass('active');
    });
    _.templateSettings.variable = "docs";
    pageTemplate = _.template($('#page-template').html());
    configTemplate = _.template($('#config-template').html());
    footerTemplate = _.template($('#footer-template').html());
    contentData = YAML.load('/content.yml');
    configData = YAML.load('/config.yml');
    $('#page-wrapper').html(pageTemplate(contentData));
    $('#header').html(configTemplate(configData));
    $('#footer').html(footerTemplate(configData));
    $('.subnav').accordion({
      speed: 'fast'
    });
    $('.anchor').on('click', function(e) {
      var target;
      e.preventDefault();
      target = $(this).attr('href');
      return $('html, body').animate({
        scrollTop: $(target).offset().top - 25
      }, 500);
    });
    nav = $('#sidebar nav').offset();
    console.log(nav);
    return $(window).scroll(function() {
      if ($(window).scrollTop() > nav.top + 35) {
        return $('#sidebar nav').addClass('fixed');
      } else {
        return $('#sidebar nav').removeClass('fixed');
      }
    });
  };

  return App;

})();

$(function() {
  var Application;
  Application = new App();
  return Application.init();
});
