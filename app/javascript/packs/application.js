import Turbolinks from 'turbolinks';

Turbolinks.start()

import compose from '../lib/compose';

import additionalInfo from '../modules/additional_info';
import audio from '../modules/audio';
import loading from '../modules/loading';
import sidebar from '../modules/sidebar';
import zoom from '../modules/zoom';

const load = compose(
  additionalInfo,
  loading,
  sidebar,
  zoom
);

const beforeVisit = compose(
  audio
);

document.addEventListener('turbolinks:load', load);
document.addEventListener('turbolinks:before-visit', beforeVisit);
