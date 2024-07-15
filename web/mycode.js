//document.addEventListener('DOMContentLoaded', function() {
//    console.log("Inline script running");
//var quantityInputs = document.querySelectorAll('.quantity');
//        quantityInputs.forEach(function(input) {
//        console.log("Calling updateAmount for input with value:", input.value);
//                updateAmount(input);
//        });
//}
console.log("External script running");
function showDeleteOverlay() {
    document.getElementById("delete-overlay").style.display = "block";
}

function hideDeleteOverlay() {
    document.getElementById("delete-overlay").style.display = "none";
}

function showInsertOverlay() {
    document.getElementById("insert-overlay").style.display = "block";
}

function hideInsertOverlay() {
    document.getElementById("insert-overlay").style.display = "none";
}

function showUpdateAccountOverlay() {
    document.getElementById("update-account-overlay").style.display = "block";
}

function hideUpdateAccountOverlay() {
    document.getElementById("update-account-overlay").style.display = "none";
}


function showInfOverlay() {
    document.getElementById("user-overlay").style.display = "block";
}

function hideInfOverlay() {
    document.getElementById("user-overlay").style.display = "none";
}





function increment(button) {
    let input = button.previousElementSibling;
    if (parseInt(input.value) < 10) {
        input.value = parseInt(input.value) + 1;
        updateAmount(input);
    }
}

function decrement(button) {
    let input = button.nextElementSibling;
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
        updateAmount(input);
    }
}

function updateAmount(input) {
    let quantity = parseInt(input.value);
    let priceElement = input.closest('.cart-item').querySelector('.price');
    let price = parseInt(priceElement.textContent.split('.')[0]); // Remove dot separator from price
    let amountElement = input.closest('.cart-item').querySelector('.amount');
    let amount = price * quantity;
    amountElement.textContent = formatPrice(amount) + '₫';
    
    console.log("Calling updateAmount for input with value:", input.value);
    updateTotal();
}

function updateTotal() {
    let total = 0;
    document.querySelectorAll('.amount').forEach(amountElement => {
        total += parseInt(amountElement.textContent.replace(/\./g, '')); // Remove dot separator from amount

    });

    document.querySelector('.totals_price').textContent = formatPrice(total) + '₫';
}

function formatPrice(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
}

window.onload = function () {
    updateTotal();
};


function submitForm(method) {
    var form = document.getElementById('myForm');
    if (method === 'method1') {
        form.action = './cart';
        form.method = 'post';
    } else if (method === 'method2') {
        form.action = './order';
        form.method = 'post';
    }
    form.submit();
}



function updateBookVisibility() {
    var books = document.querySelectorAll('.book');
    var windowWidth = window.innerWidth;

    books.forEach(function (book, index) {
        if (windowWidth < 768) { // xs and sm screens
            book.style.display = (index < 6) ? 'block' : 'none';
        } else { // md and larger screens
            book.style.display = (index < 8) ? 'block' : 'none';
        }
    });
    var books2 = document.querySelectorAll('.book2');
    var windowWidth = window.innerWidth;
    books2.forEach(function (book2, index) {
        if (windowWidth < 768) { // xs and sm screens
            book2.style.display = (index < 6) ? 'block' : 'none';
        } else { // md and larger screens
            book2.style.display = (index < 8) ? 'block' : 'none';
        }
    });
    var books3 = document.querySelectorAll('.book3');

    var windowWidth = window.innerWidth;
    books3.forEach(function (book3, index) {
        if (windowWidth < 768) { // xs and sm screens
            book3.style.display = (index < 6) ? 'block' : 'none';
        } else { // md and larger screens
            book3.style.display = (index < 8) ? 'block' : 'none';
        }
    });
}


function setRating(ratingElement, rating) {
    ratingElement.setAttribute('data-rating', rating);
}

//        const ratingElement = document.querySelector('.rating');
//        setRatingFromAttribute(ratingElement);

