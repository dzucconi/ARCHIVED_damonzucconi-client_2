import * as dom from '../lib/dom';

const bind = img =>
  new Promise((resolve, reject) => {
    const proxy = dom.tag('img');
    proxy.addEventListener('load', resolve);
    proxy.addEventListener('error', reject);
    proxy.src = img.currentSrc || img.src;
  });

const init = () => {
  const imgs = document.getElementsByTagName('img');

  if (!imgs) return;

  const loading = Array.prototype.map.call(imgs, bind);

  document.body.setAttribute('data-state', 'loading');

  Promise.all(loading)
    .then(() => {
      document.body.setAttribute('data-state', 'resting');
    });
};

export default init;
