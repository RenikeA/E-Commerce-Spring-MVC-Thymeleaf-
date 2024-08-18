<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Woodex - Login</title>
    <meta name="title" content="Woodex - Login">
    <meta name="description" content="This is an eCommerce html template made by codewithsadee">
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
                <span class="btn-badge">0</span>
            </button>
            <button class="header-action-btn" aria-label="cart">
                <ion-icon name="bag-handle-outline" aria-hidden="true"></ion-icon>
                <span class="btn-badge">0</span>
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
            <li>
                <a href="#" class="sidebar-link">French</a>
            </li>
            <li>
                <a href="#" class="sidebar-link">Arabic</a>
            </li>
        </ul>
        <ul class="sidebar-list">
            <li>
                <p class="sidebar-list-title">Currency</p>
            </li>
            <li>
                <a href="#" class="sidebar-link">USD - US Dollar</a>
            </li>
            <li>
                <a href="#" class="sidebar-link">Euro</a>
            </li>
            <li>
                <a href="#" class="sidebar-link">Pound</a>
            </li>
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
        <li>
            <p class="contact-list-title">Contact Us</p>
        </li>
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
    </div>
</div>
<div class="overlay" data-overlay data-nav-toggler></div>
<main>
    <article>
        <section class="section hero" id="checkout" aria-label="checkout">
            <div class="container">
                <h2>Checkout</h2>
                <form action="UserController" method="post">
                    <input type="hidden" name="action" value="checkout">

                    <label for="homeAddress">Home Address:</label><br>
                    <input type="text" id="homeAddress" name="homeAddress" required><br>

                    <label for="city">City:</label><br>
                    <input type="text" id="city" name="city" required><br>

                    <label for="state">State:</label><br>
                    <input type="text" id="state" name="state" required><br>

                    <label for="country">Country:</label><br>
                    <input type="text" id="country" name="country" required><br><br>

                    <input type="submit" value="Proceed to Payment">
                </form>
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
                &copy; 2022 All Rights Reserved by <a href="#" class="copyright-link">codewithsadee</a>.
            </p>

        </div>

    </div>
</footer>

<a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
    <ion-icon name="arrow-up" aria-hidden="true"></ion-icon>
</a>

<%--Get Session User--%>
<script>
    function fetchUserData() {
        fetch('/UserController?action=getUser')
            .then(response => response.json())
            .then(user => {
                if (user.error) {
                    console.error('Error:', user.error);
                } else {
                    console.log(user.userID)
                    //
                    // document.getElementById('userID').innerText = user.userID;
                    // document.getElementById('firstName').innerText = user.firstName;
                    // document.getElementById('lastName').innerText = user.lastName;
                    // document.getElementById('email').innerText = user.emailAddress;
                    // document.getElementById('phoneNumber').innerText = user.phoneNumber;

                    // Populate other elements as needed
                }
            })
            .catch(error => {
                console.error('Error fetching user data:', error);
            });
    }

    document.addEventListener('DOMContentLoaded', fetchUserData);
</script>

<script src="assetss/script.js" defer></script>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>