const creditCardRadio = document.getElementById("creditCard");
const americanExpressRadio = document.getElementById("americanExpress");
const creditCardDetails = document.getElementById("creditCardDetails");
const paypalRadio = document.getElementById("paypal");
const afterPayRadio = document.getElementById("afterPay");

console.log("creditCardRadio: clicked", creditCardRadio);

const paymentMethodRadios = [creditCardRadio, americanExpressRadio, paypalRadio, afterPayRadio];

for (const radio of paymentMethodRadios) {
  radio.addEventListener("change", toggleCreditCardDetails);
}

function toggleCreditCardDetails() {
  if (creditCardRadio.checked || americanExpressRadio.checked) {
    creditCardDetails.style.display = "block";
  } else {
    creditCardDetails.style.display = "none";
  }
}
// Validation for expiration date (MM/YY)
const expirationDateInput = document.getElementById("expirationDate");

expirationDateInput.addEventListener("input", function () {
  const value = expirationDateInput.value;
  const regex = /^(0[1-9]|1[0-2])\/\d{2}$/;
  if (!regex.test(value)) {
    expirationDateInput.setCustomValidity("Invalid format. Use MM/YY.");
  } else {
    expirationDateInput.setCustomValidity("");
  }
});

// Validation for CVV (3 digits)
const cvvInput = document.getElementById("cvv");
cvvInput.addEventListener("input", function () {
  const value = cvvInput.value;
  const regex = /^\d{3}$/;
  if (!regex.test(value)) {
    cvvInput.setCustomValidity("CVV must be 3 digits.");
  } else {
    cvvInput.setCustomValidity("");
  }
});