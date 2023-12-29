import {cart, addToCart} from './cart.js';
import {products} from './products.js';
import {formatCurrency} from './money.js';

const productsPerPage = 9;

function renderProducts(category, page = 1) {
  let productsHTML = '';
  const filteredProducts = products.filter(product => product.category === category);

  const startIndex = (page - 1) * productsPerPage;
  const endIndex = startIndex + productsPerPage;
  const paginatedProducts = filteredProducts.slice(startIndex, endIndex);

  paginatedProducts.forEach((product) => {
    productsHTML += `   
    <div class="col-lg-4">
        <div class="item">
            <div class="thumb">
                <div class="hover-content">
                   <ul>
                        <li><a href="single-product.html?productId=${product.id}"><i class="fa fa-eye"></i></a></li>
                        <li><a href="single-product.html?productId=${product.id}"><i class="fa fa-star"></i></a></li>
                        <li><a><i class="fa fa-shopping-cart button-primary js-add-to-cart" data-product-id="${product.id}"></i></a></li>
                    </ul>
                </div>
                <img src="${product.image}" alt="">
            </div>
            <div class="down-content">
                <h4>${product.brand}</h4>
                <span>${product.name}</span>
                <span>$${product.priceCents/100}</span>
                <ul class="stars">
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                </ul>
            </div>
        </div>
    </div>         
`;
  });
  document.querySelector('.js-products-grid').innerHTML = productsHTML;
  const totalPages = Math.ceil(filteredProducts.length / productsPerPage);
  const paginationHTML = generatePaginationHTML(page, totalPages);

  document.querySelector('.pagination').innerHTML = paginationHTML;

}
function generatePaginationHTML(currentPage, totalPages) {
  let paginationHTML = '';

  if (totalPages > 1) {
    paginationHTML += `
      <ul>
        <li><a href="#" data-page="1">&lt;</a></li>
    `;

    for (let i = 1; i <= totalPages; i++) {
      paginationHTML += `
        <li ${currentPage === i ? 'class="active"' : ''}><a href="#" data-page="${i}">${i}</a></li>
      `;
    }

    paginationHTML += `
      <li><a href="#" data-page="${totalPages}">&gt;</a></li>
      </ul>
    `;
  }

  return paginationHTML;
}

document.querySelector('.pagination').addEventListener('click', (event) => {
  event.preventDefault();
  const targetPage = parseInt(event.target.dataset.page);

  if (!isNaN(targetPage)) {
    renderProducts(category, targetPage);
  }
});

// Get the category from the URL query parameters
const urlParams = new URLSearchParams(window.location.search);
const category = urlParams.get('category');

// Initial rendering
renderProducts(category);

function updateCartQuantity() {
  let cartQuantity = 0;

  cart.forEach((cartItem) => {
    cartQuantity += cartItem.quantity;
  });

  document.querySelector('.js-cart-quantity')
    .innerHTML = cartQuantity;
}

document.querySelectorAll('.js-add-to-cart')
  .forEach((button) => {
    button.addEventListener('click', () => {
      const productId = button.dataset.productId;
      addToCart(productId);
      updateCartQuantity();
    });
  });

 