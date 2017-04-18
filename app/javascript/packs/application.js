import Turbolinks from 'turbolinks';

Turbolinks.start()

import sidebar from '../modules/sidebar';

document.addEventListener('turbolinks:load', sidebar);