//single-product.js
import {getProduct, products } from './checkout/products.js';
import { formatCurrency } from './checkout/money.js';
import {cart, addToCart} from './checkout/cart.js';

// Function to extract query parameters from URL
function getQueryParams() {
  const params = {};
  const queryString = window.location.search.substring(1);
  const pairs = queryString.split('&');
    for (const pair of pairs) {
        const [key, value] = pair.split('=');
        params[decodeURIComponent(key)] = decodeURIComponent(value);
    }
  return params;
}

// Fetch product details and render them
document.addEventListener('DOMContentLoaded', () => {
  const params = getQueryParams();
  const product = getProduct(params.productId);
  renderProductDetails(product);
  setupQuantityHandlers(product);

});

// Render product details
function renderProductDetails(product) {
  let productHTML = `
  <div class="row">
  <div class="col-lg-8">
  <div class="left-images">
      <img src="${product.image}" alt="">
      <img src="assets/images/single_product01.webp" alt="">
  </div>
</div>
<div class="col-lg-4">
  <div class="right-content">
      <h4>${product.brand}</h4>
      <h4 style="font-weight: normal;">${product.name}</h4>

      <!-- Add Rating Star Area-->
      <div class="product-ratting">
          <div class="ratting-icons">
            <i class="fa fa-star-o"></i>
            <i class="fa fa-star-o"></i>
            <i class="fa fa-star-o"></i>
            <i class="fa fa-star-o"></i>
            <i class="fa fa-star-o"></i>
          </div>
          <div class="ratting-caption">No Reviews</div>
        </div>
      <!-- End Rating Star Area-->  

      <span class="price">$${product.priceCents/100}</span>
      <ul class="stars">
          <li><i class="fa fa-star"></i></li>
          <li><i class="fa fa-star"></i></li>
          <li><i class="fa fa-star"></i></li>
          <li><i class="fa fa-star"></i></li>
          <li><i class="fa fa-star"></i></li>
      </ul>
      <span>TOUGH, FORGED CONSTRUCTION: Hard anodized ceramic nonstick pots and pans from KitchenAid are 8x harder than aluminum for lasting performance and feature a thick, forged base for fast and even heat conduction</span>
      <span>EASY-CLEAN CERAMIC: High performance ceramic nonstick is made without PFAS, BPA, Lead, or Cadmium* for safe, consistent food release and fast, easy cleanup (*Manufacturing process does not involve adding to the product any of these substances which may otherwise be present in the environment)</span>
      <span>KITCHEN TO TABLE DESIGN: Pots and pans are color-finished in a modern Matte Black hue for a standout, contemporary look from performance to presentation</span>
      <div class="quantity-content">
          <div class="left-content">
              <h6>No. of Orders</h6>
          </div>
          <div class="right-content">
              <div class="quantity buttons_added">
                  <input type="button" value="-" class="minus"><input type="number" step="1" min="1" max="" name="quantity"  title="Qty" class="input-text qty text quantityInput"  size="4" pattern="" inputmode=""><input type="button" value="+" class="plus">
              </div>
          </div>
      </div>
      <div class="total">
          <h4>Total $${product.priceCents/100}</h4>
          <div class="main-border-button js-add-to-cart" data-product-id="${product.id}"><a href="#">Add To Cart</a></div>
      </div>

  </div>
</div>`;

document.querySelector('.js-product-detail-container').innerHTML = productHTML; // Make sure this selector points to an existing element

let initialTotal = product.priceCents / 100;
document.querySelector('.total h4').innerText = `Total: $${initialTotal}`;


if (!document.querySelector('.js-add-to-cart').hasAttribute('data-listener-set')) {
    document.querySelector('.js-add-to-cart').addEventListener('click', function() {
        const quantity = parseInt(document.querySelector('.quantityInput').value);
        addToCart(product.id, quantity);
    });
    document.querySelector('.js-add-to-cart').setAttribute('data-listener-set', 'true');
}}

function setupQuantityHandlers(product) {
    const quantityInput = document.querySelector('.quantityInput');
    const totalDisplay = document.querySelector('.total h4');

    function updateTotal() {
        let currentQuantity = parseInt(quantityInput.value);

        // Ensure the quantity is at least 1
        if (isNaN(currentQuantity) || currentQuantity < 1) {
            currentQuantity = 1;
            quantityInput.value = currentQuantity;
        }

        const totalPrice = (product.priceCents / 100) * currentQuantity;
        totalDisplay.innerText = `Total: $${totalPrice.toFixed(2)}`;
    }

    // Set default quantity to 1 and initialize total
    quantityInput.value = 1;
    updateTotal();

    quantityInput.addEventListener('input', updateTotal);

    const updateTotalWithDelay = () => setTimeout(updateTotal, 10);

    document.querySelector('.plus').addEventListener('click', updateTotalWithDelay);
    document.querySelector('.minus').addEventListener('click', updateTotalWithDelay);
}


