let iconCart = document.querySelector('.iconCart');
let cart = document.querySelector('.cart');
let close = document.querySelector('.close');

// Utility functions for cookies

function setCookie(name, value, days) {
    let expires = "";
    if (days) {
        const date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (encodeURIComponent(value) || "") + expires + "; path=/";
}

function getCookie(name) {
    let nameEQ = name + "=";
    let ca = document.cookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return decodeURIComponent(c.substring(nameEQ.length, c.length));
    }
    return null;
}

function eraseCookie(name) {
    document.cookie = name + '=; Max-Age=-99999999;';
}

// Load cart from cookie on page load
document.addEventListener('DOMContentLoaded', function() {
    loadCartFromCookie();
    deleteInvalidItems();
    updateTotalQuantity(); // Ensure total quantity is set on page load
});

iconCart.addEventListener('click', function(){
    if(cart.style.right == '-100%'){
        cart.style.right = '0';
    } else {
        cart.style.right = '-100%';
    }
});

close.addEventListener('click', function(){
    cart.style.right = '-100%';
});

let addToCartButtons = document.querySelectorAll('.bx-cart-add');

addToCartButtons.forEach(button => {
    button.addEventListener('click', function() {
        let productBox = button.closest('.box');
        let productName = productBox.querySelector('.title-price h3').innerText;
        let productPriceElement = productBox.querySelector('.box span');
        let productPrice = productPriceElement ? productPriceElement.textContent : 'Price not available';
        let productImageElement = productBox.querySelector('.box-img img');
        let productImageSrc = productImageElement ? productImageElement.src : null;
        let productQuantity = 1;

        addItemToCart(productName, productPrice, productImageSrc, productQuantity);
        saveCartToCookie();
    });
});

document.addEventListener('click', function(event) {
    if (event.target.matches('.quantity button')) {
        handleQuantityButtonClick(event.target);
        saveCartToCookie();
    }
});

function addItemToCart(name, price, imgSrc, quantity) {
    let listCart = document.querySelector('.listCart');
    let newItem = document.createElement('div');
    newItem.classList.add('item');
    newItem.innerHTML = `
        ${imgSrc ? `<img src="${imgSrc}">` : ''}
        <div class="content">
            <div class="name">${name}</div>
            <div class="price">${price}</div>
        </div>
        <div class="quantity">
            <button>-</button>
            <span class="value">${quantity}</span>
            <button>+</button>
        </div>
    `;
    listCart.appendChild(newItem);
    updateTotalQuantity();
}
function handleQuantityButtonClick(button) {
    let item = button.closest('.item');
    let valueElement = item.querySelector('.value');
    let currentValue = parseInt(valueElement.innerText);
    let priceElement = item.querySelector('.price');
    let priceText = priceElement.innerText;

    // Extracting the numeric value from the price text
    let unitPrice = parseFloat(priceText.split('$')[1]); // Assuming the price is in the format "$X.XX"

    if (button.textContent === '+') {
        currentValue++;
    } else if (button.textContent === '-' && currentValue > 1) {
        currentValue--;
    } else if (button.textContent === '-' && currentValue === 1) {
        item.remove();
        updateTotalQuantity();
        saveCartToCookie();
        return;
    }

    valueElement.innerText = currentValue;
    priceElement.innerText = `$${(unitPrice * currentValue).toFixed(2)}`; // Update the price based on quantity

    updateTotalQuantity();
}

function updateTotalQuantity() {
    let totalQuantity = 0;
    let quantityElements = document.querySelectorAll('.quantity .value');

    quantityElements.forEach(element => {
        let quantity = parseInt(element.innerText);
        if (isNaN(quantity)) {
            quantity = 1; // Replace undefined or invalid quantity with 1
            element.innerText = quantity;
        }
        totalQuantity += quantity;
    });

    document.querySelector('.totalQuantity').innerText = totalQuantity;
}

function saveCartToCookie() {
    let cartItems = [];
    document.querySelectorAll('.listCart .item').forEach(item => {
        let name = item.querySelector('.name').innerText;
        let price = item.querySelector('.price').innerText;
        let img = item.querySelector('img');
        let imgSrc = img ? img.src : '';
        let quantity = item.querySelector('.value').innerText;
        cartItems.push({name, price, imgSrc, quantity});
    });

    setCookie('shoppingCart', JSON.stringify(cartItems), 7);
    document.cookie = 'shoppingCart=' + JSON.stringify(cartItems) + '; path=/';
}

function loadCartFromCookie() {
    let cartItems = JSON.parse(getCookie('shoppingCart') || '[]');
    cartItems.forEach(item => {
        addItemToCart(item.name, item.price, item.imgSrc, item.quantity);
    });
}
function deleteInvalidItems() {
    let listCart = document.querySelector('.listCart');
    let items = listCart.querySelectorAll('.item');

    items.forEach(item => {
       
        let name = item.querySelector('.name').innerText.trim();
        let price = item.querySelector('.price').innerText.trim();
        let quantity = item.querySelector('.value').innerText.trim();

        // Check if any essential property is empty or invalid
        if (!name || !price || !quantity || isNaN(quantity)) {
            item.remove();
        }
    });

    // Update the total quantity and save the updated cart to cookies
    updateTotalQuantity();
    saveCartToCookie();
}
