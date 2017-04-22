import Turbolinks from 'turbolinks';

Turbolinks.start()

import compose from '../lib/compose';

import loading from '../modules/loading';
import sidebar from '../modules/sidebar';
import zoom from '../modules/zoom';

const init = compose(
  loading,
  sidebar,
  zoom
);

document.addEventListener('turbolinks:load', init);
