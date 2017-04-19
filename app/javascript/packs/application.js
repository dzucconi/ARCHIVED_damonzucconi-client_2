import Turbolinks from 'turbolinks';

Turbolinks.start()

import compose from '../lib/compose';

import sidebar from '../modules/sidebar';
import zoom from '../modules/zoom';

document.addEventListener('turbolinks:load', compose(sidebar, zoom));
