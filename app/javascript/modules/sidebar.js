import Cookies from 'js-cookie';

const name = 'Sidebar';
const state = `${name}--open`;

const center = el => {
  const menu = el.getElementsByClassName(`${name}__menu`)[0];
  const active = menu.getElementsByTagName('span')[0];

  if (!active) return;

  const rect = active.getBoundingClientRect();
  const center = menu.scrollTop + rect.top - ((window.innerHeight / 2) + (rect.height / 2));

  menu.scrollTop = center;
};

const init = () => {
  const el = document.getElementsByClassName(name)[0];

  if (!el) return;

  center(el);

  const menu = el.getElementsByClassName(`${name}__menu`)[0];
  const links = menu.getElementsByTagName('a');

  Array.prototype.map.call(links, link => {
    link.addEventListener('click', () => {
      link.classList.add(`${name}__menu__link--clicked`);

      const active = menu.getElementsByTagName('span')[0];
      active.classList.add(`${name}__menu__link--deactivating`);
    })
  });

  el.getElementsByClassName(`${name}__toggle`)[0]
    .addEventListener('click', e => {
      e.preventDefault();

      const isOpen = el.classList.contains(state);

      Cookies.set(state, !isOpen);

      el.classList.toggle(state);

      center(el);
    });
};

export default init;
