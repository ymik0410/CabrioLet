import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('car_city');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
