import OpenSeadragon from 'openseadragon';
import * as dom from '../lib/dom';

const name = 'Zoom'

const bind = picture => {
  picture.addEventListener('click', e => {
    e.preventDefault();

    const url = e.currentTarget.dataset.original;

    const el = dom.tag('div', { klass: 'Zoomer' }, `
      <div class='Zoomer__close js-close'></div>
      <div class='Zoomer__indicator js-indicator'></div>
    `);

    document.body.appendChild(el);

    let viewer = OpenSeadragon({
      element: el,
      tileSources: {
        type: 'image',
        url,
      },
      animationTime: 1.5,
      blendTime: 0.0,
      constrainDuringPan: true,
      debugMode: false,
      immediateRender: false,
      maxZoomPixelRatio: 1.0,
      minZoomImageRatio: 0.9,
      showNavigationControl: false,
      springStiffness: 15.0,
      visibilityRatio: 1,
      zoomPerClick: 1.4,
      zoomPerScroll: 1.25,
    });

    viewer.addHandler('tile-loaded', () => {
      el.querySelector('.js-indicator').style.display = 'none';
    });

    const close = () => {
      if (viewer) viewer.close().destroy();
      viewer = null;
      if (el && el.parentNode) el.parentNode.removeChild(el);
    }

    el.querySelector('.js-close').addEventListener('click', e => {
      e.preventDefault();
      close();
    });

    document.addEventListener('keydown', e => {
      if (e.keyCode !== 27) return;
      close();
    });
  });

};

const init = () => {
  const els = document.getElementsByClassName(name);

  if (!els) return;

  Array.prototype.map.call(els, bind);
};

export default init;
