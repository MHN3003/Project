
// JavaScript code to update shipping price based on selected prefecture

document.addEventListener('DOMContentLoaded', function() {
    const prefectureSelect = document.getElementById('prefecture');
    const shippingPriceDisplay = document.getElementById('shippingprice');

    prefectureSelect.addEventListener('change', function() {
        const selectedPrefecture = prefectureSelect.value;
        const selectedPrefectureOption = prefectureSelect.options[prefectureSelect.selectedIndex];
        const totalPriceDisplay = document.getElementById('totalprice');
    
    // Function to calculate and update the total price
    function updateTotalPrice(shippingPrice) {
        // Parse the shipping price and total price
        const parsedShippingPrice = parseFloat(shippingPrice.replace('$', ''));
        const totalPrice = parseFloat(totalPriceDisplay.innerText.replace('$', ''));
        
        // Calculate the new total price including shipping
        const totalIncludingShipping = totalPrice + parsedShippingPrice;
        
        // Update the total price display
        totalPriceDisplay.innerText = '$' + totalIncludingShipping.toFixed(2);
    }
        // Check if a prefecture is selected
        if (selectedPrefecture) {
            // Get the price attribute from the selected option
            const shippingPrice = selectedPrefectureOption.getAttribute('price');
            shippingPriceDisplay.innerText = `${shippingPrice}`;
            updateTotalPrice(shippingPrice);
        } else {
            // If no prefecture is selected, display default shipping price
            shippingPriceDisplay.innerText = '$0.00';
           
        }
    });
});