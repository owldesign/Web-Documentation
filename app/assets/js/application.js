var App,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

App = (function() {
  function App() {
    this.accordion = bind(this.accordion, this);
    this.tabs = bind(this.tabs, this);
    this.init = bind(this.init, this);
  }

  App.prototype.init = function() {
    var styles;
    styles = ["display: block", "background: #f7cd81", "color: white", "padding: 20px 20px 20px 20px", "text-align: center", "font-weight: normal", "font-size: 20px", "line-height: 60px"].join(';');
    return console.log('%c Web Documentation!', styles, 'Has loaded.');
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
