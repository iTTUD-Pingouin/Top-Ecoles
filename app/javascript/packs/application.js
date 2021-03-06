import "bootstrap";
import { clickToSubmit } from './click_to_submit.js';
import { clickToActiveCardButton } from './click_to_active_card_button.js';
import { moveChevrons } from './chevrons_filters_movements.js';
import { clickToEnSavoirPlus } from './click_to_savoir_plus.js';
import { selectFilter } from './select_filter.js';
import { drag } from './drag_try.js';



clickToSubmit();
clickToActiveCardButton();
moveChevrons();
clickToEnSavoirPlus();
selectFilter();

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});


drag();
