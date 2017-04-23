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

  const indicator = dom.tag('div', { klass: 'indicator' });

  document.body.appendChild(indicator);

  Promise.all(loading)
    .then(() => {
      indicator.parentNode.removeChild(indicator);
    });
};

export default init;
