var name = 'sidebar';

var init = function() {
  var el = document.getElementsByClassName(name)[0];

  if (!el) return;

  el.getElementsByClassName('sidebar__toggle')[0]
    .addEventListener('click', function(e) {
      e.preventDefault();
      el.classList.toggle('sidebar--open');
    });
};

document.addEventListener('turbolinks:load', init);
