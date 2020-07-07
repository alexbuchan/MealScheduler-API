$(document).ready(function() {
  const event_type_input = $('#event_event_type_id');
  const foodEventForm = $('.food-event-form');
  const shoppingEventForm = $('.shopping-event-form');
  
  foodEventForm.hide();
  shoppingEventForm.hide();
  
  const eventForm = new EventForm(foodEventForm, shoppingEventForm);
  eventForm.shouldShowFoodEventForm(event_type_input);
  eventForm.shouldShowShoppingEventForm(event_type_input);
});

class EventForm {
  constructor(foodEventForm, shoppingEventForm) {
    this.foodEventForm = foodEventForm;
    this.shoppingEventForm = shoppingEventForm;
  }

  shouldShowFoodEventForm = (event_type_input) => {
    event_type_input.on('change', (ev) => {
      if (this.isFoodEvent(event_type_input)) {
        this.foodEventForm.show();
      } else {
        this.foodEventForm.hide();
      }
    });
  }
  
  shouldShowShoppingEventForm = (event_type_input) => {
    event_type_input.on('change', (ev) => {
      if (this.isShoppingEvent(event_type_input)) {
        this.shoppingEventForm.show();      
      } else {
        this.shoppingEventForm.hide();
      }
    });
  }
  
  isFoodEvent = (event_type_input) => {
    return parseInt(event_type_input.val()) === 1;
  }
  
  isCookingEvent = (event_type_input) => {
    return parseInt(event_type_input.val()) === 2;
  }
  
  isShoppingEvent = (event_type_input) => {
    return parseInt(event_type_input.val()) === 3;
  }
}