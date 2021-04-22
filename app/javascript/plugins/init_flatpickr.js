// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_start_date');

  if (startDateInput) {

    flatpickr(".datepicker", {
      minDate: "today",
      dateFormat: "Y-m-d",
    });
  }
}

export { initFlatpickr };




