<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String name = (String) request.getAttribute("users");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Woodex - Dashboard</title>
    <meta name="title" content="Woodex - Dashboard">
    <meta name="description" content="This is an eCommerce html template made by FIRI Solutions">
    <link rel="shortcut icon" href="assets/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Mr+De+Haviland&family=Roboto:wght@400;500;700&display=swap"
          rel="stylesheet">
    <link rel="preload" as="image" href="assets/images/hero-product-1.jpg">
    <link rel="preload" as="image" href="assets/images/hero-product-2.jpg">
    <link rel="preload" as="image" href="assets/images/hero-product-3.jpg">
    <link rel="preload" as="image" href="assets/images/hero-product-4.jpg">
    <link rel="preload" as="image" href="assets/images/hero-product-5.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .dashboard-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .dashboard-table th, .dashboard-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .dashboard-table th {
            background-color: #f2f2f2;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover, .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <style>
        /* Add your CSS styling here */
        #addProductModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        #modalContent {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body id="top">
<header class="header" data-header>
    <div class="container">
        <div class="input-wrapper">
            <input type="search" name="search" placeholder="Search Anything..." class="input-field">
            <ion-icon name="search-outline" aria-hidden="true"></ion-icon>
        </div>
        <a href="#" class="logo">Woodex</a>
        <div class="header-action">
            <button class="header-action-btn" aria-label="user">
                <ion-icon name="person-outline" aria-hidden="true"></ion-icon>
            </button>
            <button class="header-action-btn" aria-label="favorite list">
                <ion-icon name="heart-outline" aria-hidden="true"></ion-icon>
                <span class="btn-badge" id="wishlist-badge">0</span>
            </button>
            <button class="header-action-btn" aria-label="cart">
                <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>
                <span class="btn-badge" id="cart-badge">0</span>
            </button>
            <button class="header-action-btn" aria-label="open menu" data-nav-toggler>
                <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
            </button>
        </div>
    </div>
</header>
<div class="sidebar" data-navbar>
    <button class="nav-close-btn" aria-label="close menu" data-nav-toggler>
        <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
    </button>
    <div class="wrapper">
        <ul class="sidebar-list">
            <li><p class="sidebar-list-title">Language</p></li>
            <li><a href="#" class="sidebar-link">English</a></li>
            <li><a href="#" class="sidebar-link">French</a></li>
            <li><a href="#" class="sidebar-link">Arabic</a></li>
        </ul>
        <ul class="sidebar-list">
            <li><p class="sidebar-list-title">Currency</p></li>
            <li><a href="#" class="sidebar-link">USD - US Dollar</a></li>
            <li><a href="#" class="sidebar-link">Euro</a></li>
            <li><a href="#" class="sidebar-link">Pound</a></li>
        </ul>
    </div>
    <nav class="navbar">
        <ul class="navbar-list">
            <li class="navbar-item">
                <a href="#home" class="navbar-link" data-nav-link>Home</a>
            </li>
            <li class="navbar-item">
                <a href="#about" class="navbar-link" data-nav-link>About</a>
            </li>
            <li class="navbar-item">
                <a href="#product" class="navbar-link" data-nav-link>Product</a>
            </li>
            <li class="navbar-item">
                <a href="#blog" class="navbar-link" data-nav-link>Blogs</a>
            </li>
        </ul>
    </nav>
    <ul class="contact-list">
        <li><p class="contact-list-title">Contact Us</p></li>
        <li class="contact-item">
            <address class="address">
                69 Halsey St, Ny 10002, New York, United States
            </address>
        </li>
        <li class="contact-item">
            <a href="mailto:support.center@woodex.co" class="contact-link">support.center@woodex.co</a>
        </li>
        <li class="contact-item">
            <a href="tel:00001235567890" class="contact-link">(0000) 1235 567890</a>
        </li>
    </ul>
    <div class="social-wrapper">
        <p class="social-list-title">Follow US On Socials</p>
        <ul class="social-list">
            <li><a href="#" class="social-link"><ion-icon name="logo-facebook"></ion-icon></a></li>
            <li><a href="#" class="social-link"><ion-icon name="logo-twitter"></ion-icon></a></li>
            <li><a href="#" class="social-link"><ion-icon name="logo-tumblr"></ion-icon></a></li>
        </ul>
    </div>
</div>
<div class="overlay" data-overlay data-nav-toggler></div>
<main>
    <article>
        <section class="section hero" id="home" aria-label="home">
            <div class="container">
                <h2>Dashboard</h2>
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <h3>Product Inventory</h3>
                    <button id="addProductButton">Add Product</button>
                </div>

                <!-- Add Product Modal -->
                <div id="addProductModal">
                    <div id="modalContent">
                        <span class="close" id="closeModal">&times;</span>
                        <h2>Add Product</h2>
                        <form id="addProductForm">
                            <label for="productType">Product Type:</label>
                            <input type="text" id="productType" name="productType" required><br>
                            <label for="itemClass">Item Class:</label>
                            <input type="text" id="itemClass" name="itemClass" required><br>
                            <label for="productName">Product Name:</label>
                            <input type="text" id="productName" name="productName" required><br>
                            <label for="productDescription">Product Description:</label>
                            <input type="text" id="productDescription" name="productDescription" required><br>
                            <label for="productSKU">Product SKU:</label>
                            <input type="text" id="productSKU" name="productSKU" required><br>
                            <button type="button" onclick="addProduct()">Add Product</button>
                        </form>
                    </div>
                </div>

                <div id="add-product-modal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Add Product</h2>
                        <!-- Form for adding product -->
                    </div>
                </div>

                <!-- Edit Product Modal -->
                <div id="editModal" class="modal">
                    <div class="modal-content">
                        <span class="close" id="closeEditModal">&times;</span>
                        <h2>Edit Product</h2>
                        <form id="editForm">
                            <input type="hidden" id="editProductID">
                            <label for="editProductType">Type:</label>
                            <input type="text" id="editProductType"><br>
                            <label for="editItemClass">Class:</label>
                            <input type="text" id="editItemClass"><br>
                            <label for="editProductName">Name:</label>
                            <input type="text" id="editProductName"><br>
                            <label for="editProductDescription">Description:</label>
                            <input type="text" id="editProductDescription"><br>
                            <label for="editProductSKU">SKU:</label>
                            <input type="text" id="editProductSKU"><br>
                            <label for="editQuantityUpdateUserID">Quantity Update User ID:</label>
                            <input type="text" id="editQuantityUpdateUserID"><br>
                            <label for="editQuantityUpdateDate">Quantity Update Date:</label>
                            <input type="text" id="editQuantityUpdateDate"><br>
                            <label for="editQuantity">Quantity:</label>
                            <input type="text" id="editQuantity"><br>
                            <label for="editPriceUpdateUserID">Price Update User ID:</label>
                            <input type="text" id="editPriceUpdateUserID"><br>
                            <label for="editPriceUpdateDate">Price Update Date:</label>
                            <input type="text" id="editPriceUpdateDate"><br>
                            <label for="editSalesPrice">Price:</label>
                            <input type="text" id="editSalesPrice"><br>
                            <label for="editMediaUpdateUserID">Media Update User ID:</label>
                            <input type="text" id="editMediaUpdateUserID"><br>
                            <label for="editMediaUpdateDate">Media Update Date:</label>
                            <input type="text" id="editMediaUpdateDate"><br>
                            <label for="editImages">Images:</label>
                            <input type="text" id="editImages"><br>
                            <label for="editVideos">Videos:</label>
                            <input type="text" id="editVideos"><br>
                            <label for="editAttributeUpdateUserID">Attribute Update User ID:</label>
                            <input type="text" id="editAttributeUpdateUserID"><br>
                            <label for="editAttributeUpdateDate">Attribute Update Date:</label>
                            <input type="text" id="editAttributeUpdateDate"><br>
                            <label for="editMaterial">Material:</label>
                            <input type="text" id="editMaterial"><br>
                            <label for="editShape">Shape:</label>
                            <input type="text" id="editShape"><br>
                            <label for="editColor">Color:</label>
                            <input type="text" id="editColor"><br>
                            <label for="editWeight">Weight:</label>
                            <input type="text" id="editWeight"><br>
                            <label for="editLength">Length:</label>
                            <input type="text" id="editLength"><br>
                            <label for="editWidth">Width:</label>
                            <input type="text" id="editWidth"><br>
                            <label for="editHeight">Height:</label>
                            <input type="text" id="editHeight"><br>
                            <label for="editstatusUpdateUserID">Status Update User ID:</label>
                            <input type="text" id="editstatusUpdateUserID"><br>
                            <label for="editStatusUpdateDate">Status Update Date:</label>
                            <input type="text" id="editStatusUpdateDate"><br>
                            <label for="editProductStatus">Status:</label>
                            <input type="text" id="editProductStatus"><br>
                            <button type="button" id="saveEditButton">Save</button>
                        </form>
                    </div>
                </div>

                <!-- Delete Confirmation Modal -->
                <div id="deleteModal" class="modal">
                    <div class="modal-content">
                        <span class="close" id="closeDeleteModal">&times;</span>
                        <h2>Confirm Delete</h2>
                        <p>Are you sure you want to delete this product?</p>
                        <input type="hidden" id="deleteProductID">
                        <input type="hidden" id="deleteProductStatus">
                        <button id="confirmDeleteButton">Yes</button>
                        <button id="cancelDeleteButton">No</button>
                    </div>
                </div>

                <table id="product-table" class="dashboard-table">
                    <thead>
                    <tr>
                        <th>productID</th>
                        <th>productName</th>
                        <th>productStatus</th>
                        <th>salesPrice</th>
                        <th>quantity</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Dynamic table rows will be added here -->
                    </tbody>
                </table>

                <h3>User Management</h3>
                <!-- Change Role Modal -->
                <div id="changeRoleModal" class="modal">
                    <div class="modal-content">
                        <span class="close" id="closeChangeRoleModal">&times;</span>
                        <h2>Change User Role</h2>
                        <form id="changeRoleForm">
                            <input type="hidden" id="changeRoleUserID">
                            <label for="newRole">New Role:</label>
                            <select id="newRole">
                                <option value="ADMIN">ADMIN</option>
                                <option value="USER">USER</option>
                            </select>
                            <br>
                            <button type="button" id="saveChangeRoleButton">Save</button>
                        </form>
                    </div>
                </div>

                <table id="user-table" class="dashboard-table">
                    <thead>
                    <tr>
                        <th>userID</th>
                        <th>firstName</th>
                        <th>lastName</th>
                        <th>phoneNumber</th>
                        <th>role</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Dynamic table rows will be added here -->
                    </tbody>
                </table>

            </div>
        </section>
    </article>
</main>

<footer class="footer">
    <div class="container">

        <div class="footer-top section">

            <div class="footer-brand">

                <a href="#" class="logo">Woodex</a>

                <ul>

                    <li class="footer-list-item">
                        <ion-icon name="location-sharp" aria-hidden="true"></ion-icon>

                        <address class="address">
                            Woodex, Chicago, USA 2022
                        </address>
                    </li>

                    <li class="footer-list-item">
                        <ion-icon name="call-sharp" aria-hidden="true"></ion-icon>

                        <a href="tel:+1234567890" class="footer-link">+1234567890</a>
                    </li>

                    <li>
                        <ul class="social-list">

                            <li>
                                <a href="#" class="social-link">
                                    <ion-icon name="logo-facebook"></ion-icon>
                                </a>
                            </li>

                            <li>
                                <a href="#" class="social-link">
                                    <ion-icon name="logo-twitter"></ion-icon>
                                </a>
                            </li>

                            <li>
                                <a href="#" class="social-link">
                                    <ion-icon name="logo-tumblr"></ion-icon>
                                </a>
                            </li>

                        </ul>
                    </li>

                </ul>

            </div>

            <ul class="footer-list">

                <li>
                    <p class="footer-list-title">Help & Information</p>
                </li>

                <li>
                    <a href="#" class="footer-link">Help & Contact Us</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Returns & Refunds</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Online Stores</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Terms & Conditions</a>
                </li>

            </ul>

            <ul class="footer-list">

                <li>
                    <p class="footer-list-title">About Us</p>
                </li>

                <li>
                    <a href="#" class="footer-link">About Us</a>
                </li>

                <li>
                    <a href="#" class="footer-link">What We Do</a>
                </li>

                <li>
                    <a href="#" class="footer-link">FAQ Page</a>
                </li>

                <li>
                    <a href="#" class="footer-link">Contact Us</a>
                </li>

            </ul>

            <div class="footer-list">

                <p class="footer-list-title">Newsletter</p>

                <form action="" class="footer-form">
                    <input type="email" name="email_address" placeholder="Your email address" required class="email-field">

                    <button type="submit" class="footer-form-btn">
                        <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                    </button>
                </form>

                <div class="wrapper">

                    <a href="#" class="footer-link">Term & Condition</a>
                    <a href="#" class="footer-link">Policy</a>
                    <a href="#" class="footer-link">Map</a>

                </div>

            </div>

        </div>

        <div class="footer-bottom">

            <p class="copyright">
                &copy; 2022 All Rights Reserved by <a href="#" class="copyright-link">FIRI Solutions</a>.
            </p>

        </div>

    </div>
</footer>

<a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
    <ion-icon name="arrow-up" aria-hidden="true"></ion-icon>
</a>



<%--Get Session User--%>
<script>
    // Global variable to store user data
    var userData = null;

    function fetchUserData() {
        fetch('/UserController?action=getUser')
            .then(response => response.json())
            .then(user => {
                if (user.error) {
                    console.error('Error:', user.error);
                } else {
                    userData = user; // Store the fetched user data in the global variable
                    console.log('User ID:', user.userID);
                    console.log('Like Value:', user.wishListProductIDs);
                    console.log('Cart Value:', user.productIDCountMapping);

                    // Update the badges with the counts
                    updateBadges();

                    // Populate your elements here if needed
                    // document.getElementById('userID').innerText = user.userID;
                    // document.getElementById('firstName').innerText = user.firstName;
                    // document.getElementById('lastName').innerText = user.lastName;
                    // document.getElementById('email').innerText = user.emailAddress;
                    // document.getElementById('phoneNumber').innerText = user.phoneNumber;
                }
            })
            .catch(error => {
                console.error('Error fetching user data:', error);
            });
    }

    function countProductsInMapping(productIDCountMapping) {
        if (!productIDCountMapping) {
            return 0; // Return 0 if the string is null or empty
        }
        return productIDCountMapping.split(',').length;
    }

    function countProductsInWishlist(wishListProductIDs) {
        if (!wishListProductIDs) {
            return 0; // Return 0 if the string is null or empty
        }
        return wishListProductIDs.split(',').length;
    }

    function updateBadges() {
        if (userData) {
            var wishlistCount = countProductsInWishlist(userData.wishListProductIDs);
            var cartCount = countProductsInMapping(userData.productIDCountMapping);
            console.log('Cart Value:', wishlistCount);
            console.log('Cart Value:', cartCount);

            document.getElementById('wishlist-badge').innerText = wishlistCount;
            document.getElementById('cart-badge').innerText = cartCount;
        }
    }

    // Ensure the DOM is fully loaded before running the script
    document.addEventListener('DOMContentLoaded', function() {
        fetchUserData();

        // Like & Cart
        // Select the parent element that contains all product list items
        var productList = document.querySelector('.grid-list.product-list');

        // Add click event listener to the parent element
        productList.addEventListener('click', function(event) {
            // Check if the clicked element is a button with class 'card-action-btn'
            if (event.target.classList.contains('card-action-btn')) {
                // Get the button element that was clicked
                var button = event.target;

                // Prevent default action (e.g., following a link or submitting a form)
                event.preventDefault();

                // Log to console to check if event listener is triggered
                console.log('Button clicked:', button);

                // Check if the button has aria-label set to "Add to cart" or "Add to wishlist"
                var ariaLabel = button.getAttribute('aria-label');

                if (ariaLabel === 'Add to cart' || ariaLabel === 'Add to wishlist') {
                    // Log the action being performed
                    console.log('Performing action:', ariaLabel);

                    // Retrieve the productID from the button's ion-icon
                    var productID = button.querySelector('ion-icon').getAttribute('data-product-id');
                    console.log('ProductID:', productID);

                    // Ensure userData is available before proceeding
                    if (userData) {
                        var params = new URLSearchParams();
                        params.append('action', ariaLabel === 'Add to cart' ? 'addToCartAction' : 'wishlistAction');
                        params.append('userID', userData.userID); // Use the stored user data
                        params.append(ariaLabel === 'Add to cart' ? 'cartProductID' : 'wishListProductIDs', productID);
                        params.append(ariaLabel === 'Add to cart' ? 'lastCartUpdateUserID' : 'lastWishlistUpdateUserID', userData.userID); // Use the stored user data
                        params.append(ariaLabel === 'Add to cart' ? 'lastCartUpdateDate' : 'lastWishlistUpdateDate', new Date().toISOString().split('T')[0]);

                        fetch('/UserController', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                            body: params.toString()
                        })
                            .then(response => {
                                if (response.ok) {
                                    return response.text(); // Assuming the response is text
                                } else {
                                    throw new Error('Network response was not ok');
                                }
                            })
                            .then(data => {
                                console.log('Response:', data);
                                // Optionally, update the badge counts again after the action is performed
                                fetchUserData();
                            })
                            .catch(error => {
                                console.error('Request failed:', error);
                            });
                    } else {
                        console.error('User data not loaded yet.');
                    }
                }
            }
        });
    });
</script>

<%--Add Product--%>
<script>
    // JavaScript to handle modal display
    const modal = document.getElementById("addProductModal");
    const btn = document.getElementById("addProductButton");
    const span = document.getElementById("closeModal");

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function addProduct() {
        const productType = document.getElementById('productType').value;
        const itemClass = document.getElementById('itemClass').value;
        const productName = document.getElementById('productName').value;
        const productDescription = document.getElementById('productDescription').value;
        const productSKU = document.getElementById('productSKU').value;

        const productData = new URLSearchParams({
            productType, itemClass, productName, productDescription, productSKU
        });

        fetch(`/ProductController?action=addProduct`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: productData.toString()
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.text();
            })
            .then(result => {
                console.log('Add product result:', result);
                modal.style.display = "none";
                // Optionally, refresh the product list or perform other UI updates
            })
            .catch(error => {
                console.error('Error adding product:', error);
            });
    }
</script>

<%--Edit & Delete Products Data--%>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        setupEventListeners();
        fetchProducts();
    });

    function setupEventListeners() {
        document.getElementById('confirmDeleteButton').onclick = confirmDelete;
        document.getElementById('closeEditModal').onclick = () => document.getElementById('editModal').style.display = 'none';
        document.getElementById('closeDeleteModal').onclick = () => document.getElementById('deleteModal').style.display = 'none';
        document.getElementById('cancelDeleteButton').onclick = () => document.getElementById('deleteModal').style.display = 'none';
        document.getElementById('saveEditButton').onclick = saveEdit;
    }

    function fetchProducts() {
        fetch('/ProductController?action=getProducts')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.text();
            })
            .then(products => {
                const tableBody = document.querySelector('#product-table tbody');
                tableBody.innerHTML = '';
                const rows = products.trim().split('\n');
                rows.forEach(rowData => {
                    const cells = rowData.split(', ').reduce((acc, cell) => {
                        const [key, value] = cell.split(': ');
                        acc[key.trim()] = value ? value.trim() : '';
                        return acc;
                    }, {});
                    const row = document.createElement('tr');
                    const orderedKeys = ['productID', 'productName', 'productStatus', 'salesPrice', 'quantity'];
                    orderedKeys.forEach(key => {
                        const cellElement = document.createElement('td');
                        cellElement.textContent = cells[key] || '';
                        row.appendChild(cellElement);
                    });
                    const actionsCell = document.createElement('td');
                    const editButton = document.createElement('button');
                    editButton.textContent = 'Edit';
                    editButton.className = 'edit-btn';
                    editButton.onclick = () => editProduct(cells['productID']);
                    const deleteButton = document.createElement('button');
                    deleteButton.textContent = 'Delete';
                    deleteButton.className = 'delete-btn';
                    deleteButton.onclick = () => deleteProduct(cells['productID'], cells['productStatus']);
                    actionsCell.appendChild(editButton);
                    actionsCell.appendChild(deleteButton);
                    row.appendChild(actionsCell);
                    tableBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error fetching product data:', error);
                const tableBody = document.querySelector('#product-table tbody');
                tableBody.innerHTML = '<tr><td colspan="6">Error fetching product data.</td></tr>';
            });
    }

    let originalValues = {};

    function editProduct(productID) {
        fetch(`/ProductController?action=getProduct&productID=` + productID)
            .then(response => response.json())
            .then(product => {
                originalValues = {
                    productID: product.productID,
                    productType: product.productType,
                    itemClass: product.itemClass,
                    productName: product.productName,
                    productDescription: product.productDescription,
                    productSKU: product.productSKU,
                    quantity: product.quantity,
                    quantityUpdateUserID: product.quantityUpdateUserID,
                    quantityUpdateDate: product.quantityUpdateDate,
                    salesPrice: product.salesPrice,
                    priceUpdateUserID: product.priceUpdateUserID,
                    priceUpdateDate: product.priceUpdateDate,
                    images: product.images,
                    videos: product.videos,
                    mediaUpdateUserID: product.mediaUpdateUserID,
                    mediaUpdateDate: product.mediaUpdateDate,
                    material: product.material,
                    shape: product.shape,
                    color: product.color,
                    weight: product.weight,
                    length: product.length,
                    width: product.width,
                    height: product.height,
                    attributeUpdateUserID: product.attributeUpdateUserID,
                    attributeUpdateDate: product.attributeUpdateDate,
                    productStatus: product.productStatus,
                    statusUpdateUserID: product.statusUpdateUserID,
                    statusUpdateDate: product.statusUpdateDate
                };

                document.getElementById('editProductID').value = product.productID;
                document.getElementById('editProductType').value = product.productType;
                document.getElementById('editItemClass').value = product.itemClass;
                document.getElementById('editProductName').value = product.productName;
                document.getElementById('editProductDescription').value = product.productDescription;
                document.getElementById('editProductSKU').value = product.productSKU;
                document.getElementById('editQuantity').value = product.quantity;
                document.getElementById('editSalesPrice').value = product.salesPrice;
                document.getElementById('editImages').value = product.images;
                document.getElementById('editVideos').value = product.videos;
                document.getElementById('editMaterial').value = product.material;
                document.getElementById('editShape').value = product.shape;
                document.getElementById('editColor').value = product.color;
                document.getElementById('editWeight').value = product.weight;
                document.getElementById('editLength').value = product.length;
                document.getElementById('editWidth').value = product.width;
                document.getElementById('editHeight').value = product.height;
                document.getElementById('editProductStatus').value = product.productStatus;

                document.getElementById('editModal').style.display = 'block';
            })
            .catch(error => {
                console.error('Error fetching product details:', error);
            });
    }

    function saveEdit() {
        const productID = document.getElementById('editProductID').value;
        const productType = document.getElementById('editProductType').value;
        const itemClass = document.getElementById('editItemClass').value;
        const productName = document.getElementById('editProductName').value;
        const productDescription = document.getElementById('editProductDescription').value;
        const productSKU = document.getElementById('editProductSKU').value;
        const quantity = document.getElementById('editQuantity').value;
        const salesPrice = document.getElementById('editSalesPrice').value;
        const images = document.getElementById('editImages').value;
        const videos = document.getElementById('editVideos').value;
        const material = document.getElementById('editMaterial').value;
        const shape = document.getElementById('editShape').value;
        const color = document.getElementById('editColor').value;
        const weight = document.getElementById('editWeight').value;
        const length = document.getElementById('editLength').value;
        const width = document.getElementById('editWidth').value;
        const height = document.getElementById('editHeight').value;
        const productStatus = document.getElementById('editProductStatus').value;

        const currentTimestamp = new Date().toISOString().slice(0, 19).replace('T', ' ');

        const requests = [];

        if (productType !== originalValues.productType || itemClass !== originalValues.itemClass ||
            productName !== originalValues.productName || productDescription !== originalValues.productDescription ||
            productSKU !== originalValues.productSKU) {
            const mainData = new URLSearchParams({
                productID, productType, itemClass, productName, productDescription, productSKU
            });
            requests.push(fetch(`/ProductController?action=updateMainData`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: mainData.toString()
            }));
        }

        if (quantity !== originalValues.quantity) {
            const quantityData = new URLSearchParams({
                productID, quantity, quantityUpdateUserID: '1', quantityUpdateDate: currentTimestamp
            });
            requests.push(fetch(`/ProductController?action=updateProductQuantity`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: quantityData.toString()
            }));
        }

        if (salesPrice !== originalValues.salesPrice) {
            const priceData = new URLSearchParams({
                productID, salesPrice, priceUpdateUserID: '1', priceUpdateDate: currentTimestamp
            });
            requests.push(fetch(`/ProductController?action=updateProductPrice`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: priceData.toString()
            }));
        }

        if (images !== originalValues.images || videos !== originalValues.videos) {
            const mediaData = new URLSearchParams({
                productID, images, videos, mediaUpdateUserID: '1', mediaUpdateDate: currentTimestamp
            });
            requests.push(fetch(`/ProductController?action=updateProductMedia`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: mediaData.toString()
            }));
        }

        if (
            material !== originalValues.material ||
            shape !== originalValues.shape ||
            color !== originalValues.color ||
            weight !== originalValues.weight ||
            length !== originalValues.length ||
            width !== originalValues.width ||
            height !== originalValues.height
        ) {
            const attributesData = new URLSearchParams({
                productID, material, shape, color, weight, length, width, height, attributeUpdateUserID: '1', attributeUpdateDate: currentTimestamp
            });
            requests.push(fetch(`/ProductController?action=updateProductAttribute`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: attributesData.toString()
            }));
        }

        if (productStatus !== originalValues.productStatus) {
            const statusData = new URLSearchParams({
                productID, productStatus, statusUpdateUserID: '1', statusUpdateDate: currentTimestamp
            });
            requests.push(fetch(`/ProductController?action=updateProductStatus`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: statusData.toString()
            }));
        }

        Promise.all(requests)
            .then(responses => {
                for (let response of responses) {
                    if (!response.ok) {
                        throw new Error('Failed to save product');
                    }
                }
                fetchProducts(); // Refresh products
            })
            .catch(error => {
                console.error('Error saving product:', error);
            });

        document.getElementById('editModal').style.display = 'none';
    }


    function deleteProduct(productID, productStatus) {
        document.getElementById('deleteProductID').value = productID;
        document.getElementById('deleteProductStatus').value = productStatus;
        document.getElementById('deleteModal').style.display = 'block';
    }

    function confirmDelete() {
        const productID = document.getElementById('deleteProductID').value;
        const productStatus = document.getElementById('deleteProductStatus').value;
        const data = new URLSearchParams({ productID, productStatus });

        fetch(`/ProductController?action=deleteProduct`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: data.toString()
        })
            .then(response => {
                if (response.ok) {
                    // Delay for 5 seconds (5000 milliseconds)
                    setTimeout(fetchProducts, 5000);
                } else {
                    throw new Error('Failed to delete product');
                }
            })
            .catch(error => {
                console.error('Error deleting product:', error);
            });
        document.getElementById('deleteModal').style.display = 'none';
    }

</script>

<%--Update Users Data--%>
<script>
    function fetchUsers() {
        fetch('/UserController?action=getUsers')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.text(); // Retrieve plain text response
            })
            .then(users => {
                const tableBody = document.querySelector('#user-table tbody');
                tableBody.innerHTML = ''; // Clear any existing rows

                // Split the text response into rows based on newline characters
                const rows = users.trim().split('\n');

                rows.forEach(rowData => {
                    // Split each row into key-value pairs based on comma separator
                    const cells = rowData.split(', ').reduce((acc, cell) => {
                        const [key, value] = cell.split(': ');
                        acc[key.trim()] = value ? value.trim() : ''; // Create an object with key-value pairs
                        return acc;
                    }, {});

                    // Create a table row and populate it with cell data
                    const row = document.createElement('tr');

                    // Define the order of the keys based on the table header
                    const orderedKeys = ['userID', 'firstName', 'lastName', 'phoneNumber', 'role'];

                    orderedKeys.forEach(key => {
                        const cellElement = document.createElement('td');
                        cellElement.textContent = cells[key] || ''; // Populate cell with value
                        row.appendChild(cellElement);
                    });

                    // Add buttons to the last column
                    const actionsCell = document.createElement('td');
                    const changeRoleButton = document.createElement('button');
                    changeRoleButton.textContent = 'Change Role';
                    changeRoleButton.className = 'change-role-btn';
                    changeRoleButton.onclick = () => openChangeRoleModal(cells['userID']);
                    actionsCell.appendChild(changeRoleButton);
                    row.appendChild(actionsCell);

                    tableBody.appendChild(row); // Append row to table
                });
            })
            .catch(error => {
                console.error('Error fetching user data:', error);
                const tableBody = document.querySelector('#user-table tbody');
                tableBody.innerHTML = '<tr><td colspan="6">Error fetching user data.</td></tr>';
            });
    }

    function openChangeRoleModal(userID) {
        document.getElementById('changeRoleUserID').value = userID;
        document.getElementById('changeRoleModal').style.display = 'block';
    }

    function changeUserRole() {
        const userID = document.getElementById('changeRoleUserID').value;
        const newRole = document.getElementById('newRole').value;

        console.log(userID);
        console.log(newRole);

        const roleData = new URLSearchParams({
            userID: userID,
            role: newRole
        });

        fetch(`/UserController?action=updateUserRole`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: roleData.toString()
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.text();
            })
            .then(result => {
                console.log('Role change result:', result);
                fetchUsers(); // Reload the table data after the role change
                document.getElementById('changeRoleModal').style.display = 'none';
            })
            .catch(error => {
                console.error('Error changing role:', error);
            });
    }

    document.getElementById('saveChangeRoleButton').onclick = changeUserRole;

    document.getElementById('closeChangeRoleModal').onclick = () => {
        document.getElementById('changeRoleModal').style.display = 'none';
    };

    document.addEventListener('DOMContentLoaded', fetchUsers);
</script>


<script src="assets/js/script.js" defer></script>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>