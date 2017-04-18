const name = 'sidebar';

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

  console.log(el)

  if (!el) return;

  el.getElementsByClassName(`${name}__toggle`)[0]
    .addEventListener('click', e => {
      e.preventDefault();
      el.classList.toggle(`${name}--open`);
      center(el);
    });
};

export default init;
