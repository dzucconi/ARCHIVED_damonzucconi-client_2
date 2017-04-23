const name = 'ArtworkCanonical';

const init = () => {
  const el = document.getElementsByClassName(name)[0];

  if (!el) return;

  el.getElementsByClassName(`${name}__toggle`)[0]
    .addEventListener('click', e => {
      e.preventDefault();
      el.classList.toggle(`${name}--open`);
    });
};

export default init;
