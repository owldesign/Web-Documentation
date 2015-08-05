var App,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

App = (function() {
  function App() {
    this.accordion = bind(this.accordion, this);
    this.tabs = bind(this.tabs, this);
    this.init = bind(this.init, this);
  }

  App.prototype.init = function() {
    var configTemplate, pageTemplate, scrollTo, styles;
    styles = ["display: block", "background: #f7cd81", "color: white", "padding: 20px 20px 20px 20px", "text-align: center", "font-weight: normal", "font-size: 20px", "line-height: 60px"].join(';');
    console.log('%c Web Documentation!', styles, 'Has loaded.');
    scrollTo = function(hash) {
      return location.hash = '#' + hash;
    };
    $(document).on('click', '#sidebar a', function(e) {
      return console.log(e);
    });
    _.templateSettings.variable = "docs";
    pageTemplate = _.template($('#page-template').html());
    configTemplate = _.template($('#config-template').html());
    return $.ajax({
      url: '/content.yml',
      success: function(data) {
        YAML.load('/content.yml', function(content) {
          $('#page-wrapper').html(pageTemplate(content));
          return Prism.highlightAll();
        });
        return YAML.load('/config.yml', function(config) {
          $('#sidebar header').html(configTemplate(config));
          return console.log(config);
        });
      },
      error: function(error) {
        return console.log(error);
      }
    });
  };

  App.prototype.tabs = function() {
    return $("#tabs").tabulous({
      effect: "scale"
    });
  };

  App.prototype.accordion = function() {
    $(".subnav").accordion({
      speed: "fast"
    });
    return $(".accordion").accordion({
      speed: "fast"
    });
  };

  return App;

})();

$(function() {
  var Application;
  Application = new App();
  Application.init();
  Application.tabs();
  return Application.accordion();
});
