var name = 'sidebar';

var center = function(el) {
  const menu = el.getElementsByClassName(name + '__menu')[0];
  const active = menu.getElementsByTagName('span')[0];
  if (!active) return;
  const rect = active.getBoundingClientRect();
  const center = menu.scrollTop + rect.top - ((window.innerHeight / 2) + (rect.height / 2));
  menu.scrollTop = center;
};

var init = function() {
  var el = document.getElementsByClassName(name)[0];

  if (!el) return;

  el.getElementsByClassName(name + '__toggle')[0]
    .addEventListener('click', function(e) {
      e.preventDefault();
      el.classList.toggle(name + '--open');
      center(el);
    });
};

document.addEventListener('turbolinks:load', init);
