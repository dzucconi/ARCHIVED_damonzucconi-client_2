import Turbolinks from 'turbolinks';

Turbolinks.start()

import compose from '../lib/compose';

import loading from '../modules/loading';
import sidebar from '../modules/sidebar';
import zoom from '../modules/zoom';
import additionalInfo from '../modules/additional_info';

const init = compose(
  loading,
  sidebar,
  zoom,
  additionalInfo
);

document.addEventListener('turbolinks:load', init);
