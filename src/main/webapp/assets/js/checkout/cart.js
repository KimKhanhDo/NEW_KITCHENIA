//cart.js

export let cart = JSON.parse(localStorage.getItem('cart'));
console.log('Initial Cart:', cart);
if (!cart) {
  cart = []; // Initialize as an empty array

  // Add the product with the initial quantity
  cart.push({
    productId: 'e43638ce-6aa0-4b85-b27f-e1d07eb678c6',
    quantity: 2,
    deliveryOptionId: '1'
  }, {
    productId: '15b6fc6f-327a-4ec4-896f-486349e85a3d',
    quantity: 1,
    deliveryOptionId: '2'
  });

  localStorage.setItem('cart', JSON.stringify(cart));
}
// Function to update cart quantity in the header
function updateCartQuantity() {
  const cartQuantityDisplay = document.querySelector('.js-cart-quantity');
  let totalQuantity = 0;

  // Fetch the cart from localStorage
  const cart = JSON.parse(localStorage.getItem('cart')) || [];
  cart.forEach(item => {
      totalQuantity += item.quantity;
  });

  cartQuantityDisplay.innerText = totalQuantity;
}

function saveToStorage() {
  console.log("Saving to localStorage:", cart);
  localStorage.setItem('cart', JSON.stringify(cart));
  updateCartQuantity()
}

export function addToCart(productId, quantity = 1) {
  let matchingItem;

  cart.forEach((cartItem) => {
    if (productId === cartItem.productId) {
      matchingItem = cartItem;
    }
    
  });

  if (matchingItem) {
    matchingItem.quantity += quantity;
  } else {
    cart.push({
      productId: productId,
      quantity: quantity,
      deliveryOptionId: '1'
    });
    
  }

  saveToStorage(); 
  console.log('Adding product with ID:', productId, cart); 
}

export function removeFromCart(productId) {
  const newCart = [];

  cart.forEach((cartItem) => {
    if (cartItem.productId !== productId) {
      newCart.push(cartItem);
    }
  });

  cart = newCart;

  saveToStorage();

}

export function updateDeliveryOption(productId, deliveryOptionId) {
  let matchingItem;

  cart.forEach((cartItem) => {
    if (productId === cartItem.productId) {
      matchingItem = cartItem;
    }
  });

  matchingItem.deliveryOptionId = deliveryOptionId;

  saveToStorage();
  
}
document.addEventListener('DOMContentLoaded', updateCartQuantity);
// console.log(window.localStorage);
// localStorage.clear();