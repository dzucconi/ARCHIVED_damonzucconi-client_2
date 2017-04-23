import Turbolinks from 'turbolinks';

Turbolinks.start()

import compose from '../lib/compose';

import loading from '../modules/loading';
import sidebar from '../modules/sidebar';
import zoom from '../modules/zoom';
import artwork_canonical from '../modules/artwork-canonical';

const init = compose(
  loading,
  sidebar,
  zoom,
  artwork_canonical
);

document.addEventListener('turbolinks:load', init);
