const name = 'sidebar';

const init = () => {
  const el = document.getElementsByClassName(name)[0];
  el.getElementsByClassName('sidebar__toggle')[0]
    .addEventListener('click', e => {
      e.preventDefault();
      el.classList.toggle('sidebar--open');
    });
};

document.addEventListener('turbolinks:load', init);
