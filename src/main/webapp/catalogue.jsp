<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Woodex - Login</title>
    <meta name="title" content="Woodex - Login">
    <meta name="description" content="This is an eCommerce html template made by FIRI Solutions">
    <link rel="shortcut icon" href="assets/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        /*-----------------------------------*\
  #style.css
\*-----------------------------------*/

        /**
         * copyright 2022 codewithsadee
         */





        /*-----------------------------------*\
          #CUSTOM PROPERTY
        \*-----------------------------------*/

        :root {

            /**
             * colors
             */

            --red-orange-color-wheel: hsl(17, 96%, 48%);
            --middle-blue-green: hsl(167, 45%, 72%);
            --smokey-black: hsl(0, 0%, 7%);
            --spanish-gray: hsl(0, 0%, 60%);
            --granite-gray: hsl(0, 0%, 40%);
            --tan-crayola: hsl(27, 46%, 58%);
            --light-gray: hsl(0, 0%, 80%);
            --black_10: hsla(0, 0%, 0%, 0.1);
            --black_25: hsla(0, 0%, 0%, 0.25);
            --black_50: hsla(0, 0%, 0%, 0.4);
            --black_70: hsla(0, 0%, 0%, 0.7);
            --cultured: hsl(220, 16%, 96%);
            --manatee: hsl(218, 11%, 65%);
            --black: hsl(0, 0%, 0%);
            --white: hsl(0, 0%, 100%);

            /**
             * typography
             */

            --ff-roboto: 'Roboto', sans-serif;
            --ff-mr_de_haviland: 'Mr De Haviland', cursive;

            --fs-1: 6rem;
            --fs-2: 3rem;
            --fs-3: 2rem;
            --fs-4: 1.8rem;
            --fs-5: 1.4rem;
            --fs-6: 1.2rem;

            --fw-700: 700;
            --fw-500: 500;

            /**
             * spacing
             */

            --section-padding: 50px;

            /**
             * shadow
             */

            --shadow: 0 0 2px hsla(0, 0%, 0%, 0.2);

            /**
             * transition
             */

            --transition-1: 0.25s ease;
            --transition-2: 0.5s ease;
            --cubic-in: cubic-bezier(0.51, 0.03, 0.64, 0.28);
            --cubic-out: cubic-bezier(0.33, 0.85, 0.4, 0.96);

        }





        /*-----------------------------------*\
          #RESET
        \*-----------------------------------*/

        *,
        *::before,
        *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li { list-style: none; }

        a,
        img,
        span,
        input,
        button,
        ion-icon { display: block; }

        a {
            color: inherit;
            text-decoration: none;
        }

        img { height: auto; }

        input,
        button {
            background: none;
            border: none;
            font: inherit;
        }

        input { width: 100%; }

        button { cursor: pointer; }

        ion-icon { pointer-events: none; }

        address { font-style: normal; }

        html {
            font-family: var(--ff-roboto);
            font-size: 10px;
            scroll-behavior: smooth;
        }

        body {
            background-color: var(--white);
            color: var(--black);
            font-size: 1.6rem;
            line-height: 1.7;
        }

        body.active { overflow: hidden; }

        :focus-visible { outline-offset: 4px; }

        ::placeholder { color: var(--manatee); }

        ::-webkit-scrollbar { width: 10px; }

        ::-webkit-scrollbar-track { background-color: hsl(0, 0%, 98%); }

        ::-webkit-scrollbar-thumb { background-color: hsl(0, 0%, 80%); }

        ::-webkit-scrollbar-thumb:hover { background-color: hsl(0, 0%, 70%); }





        /*-----------------------------------*\
          #REUSED STYLE
        \*-----------------------------------*/

        .container { padding-inline: 15px; }

        .social-wrapper {
            display: flex;
            align-items: center;
        }

        .social-list {
            display: flex;
            gap: 30px;
        }

        .social-link { transition: var(--transition-1); }

        .social-link:is(:hover, :focus) { color: var(--tan-crayola); }

        .section { padding-block: var(--section-padding); }

        .img-holder {
            aspect-ratio: var(--width) / var(--height);
            background-color: var(--light-gray);
            overflow: hidden;
        }

        .img-cover {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .h2,
        .h3 {
            color: var(--smokey-black);
            font-weight: var(--fw-500);
            line-height: 1.4;
        }

        .h2 { font-size: var(--fs-2); }

        .h3 { font-size: var(--fs-3); }

        .grid-list {
            display: grid;
            gap: 35px;
        }

        .has-before {
            position: relative;
            z-index: 1;
        }

        .has-before::before {
            content: "";
            position: absolute;
        }





        /*-----------------------------------*\
          #HEADER
        \*-----------------------------------*/

        .header .input-wrapper { display: none; }

        .header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            background-color: var(--white);
            padding-block: 15px;
            z-index: 4;
        }

        .header.active {
            position: fixed;
            transform: translateY(-100%);
            box-shadow: var(--shadow);
            animation: slideIn 0.5s ease forwards;
        }

        @keyframes slideIn {
            0% { transform: translateY(-100%); }
            100% { transform: translateY(0); }
        }

        .header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .logo {
            font-size: 3.3rem;
            font-weight: var(--fw-700);
        }

        .header-action {
            display: flex;
            gap: 15px;
        }

        .header-action-btn {
            position: relative;
            font-size: 24px;
            transition: var(--transition-1);
        }

        .header-action-btn:is(:hover, :focus) { color: var(--tan-crayola); }

        .header-action-btn .btn-badge {
            background-color: var(--tan-crayola);
            color: var(--white);
            font-size: var(--fs-6);
            font-weight: var(--fw-500);
            position: absolute;
            bottom: -10px;
            right: -10px;
            padding-inline: 6px;
            border-radius: 50%;
        }





        /*-----------------------------------*\
          #SIDEBAR
        \*-----------------------------------*/

        .sidebar {
            position: fixed;
            top: 0;
            right: -420px;
            max-width: 420px;
            width: 100%;
            height: 100%;
            background-color: var(--white);
            padding: 40px;
            padding-block-end: 100px;
            overflow-y: auto;
            z-index: 5;
            visibility: hidden;
            transition: 0.25s var(--cubic-in);
        }

        .sidebar.active {
            transform: translateX(-420px);
            visibility: visible;
            transition: 0.5s var(--cubic-out);
        }

        .nav-close-btn { font-size: 30px; }

        .sidebar .wrapper {
            display: grid;
            grid-template-columns: 1fr 1fr;
            margin-block: 40px 75px;
        }

        .sidebar-list-title,
        .contact-list-title,
        .social-list-title {
            color: var(--smokey-black);
            font-weight: var(--fw-500);
        }

        .sidebar-list-title { margin-block-end: 15px; }

        .sidebar-link {
            color: var(--spanish-gray);
            margin-block-start: 6px;
            transition: var(--transition-1);
        }

        .sidebar-link:is(:hover, :focus) { color: var(--tan-crayola); }

        .navbar { margin-block-end: 60px; }

        .navbar-item:not(:last-child) { margin-block-end: 15px; }

        .navbar-link {
            font-weight: var(--fw-500);
            transition: var(--transition-1);
        }

        .navbar-link:is(:hover, :focus),
        .sidebar :is(.address, .contact-item) { color: var(--granite-gray); }

        .sidebar .address { margin-block-start: 20px; }

        .sidebar .social-wrapper {
            justify-content: space-between;
            margin-block-start: 50px;
        }

        .overlay {
            position: fixed;
            inset: 0;
            background-color: var(--black_70);
            z-index: 4;
            opacity: 0;
            pointer-events: none;
            transition: var(--transition-1);
        }

        .overlay.active {
            opacity: 1;
            pointer-events: all;
        }





        /*-----------------------------------*\
          #HERO
        \*-----------------------------------*/

        .hero { padding-block-start: calc(var(--section-padding) + 60px); }

        .hero-list {
            display: grid;
            gap: 15px;
        }

        .hero-card { position: relative; }

        .hero-card .img-cover { transition: var(--transition-2); }

        .hero-card:is(:hover, :focus) .img-cover { transform: scale(1.1); }

        .hero-card .card-content {
            position: absolute;
            top: 30px;
            left: 30px;
            right: 30px;
        }

        .hero-card :is(.card-title, .card-text) { font-weight: var(--fw-500); }

        .hero-card .card-title {
            font-size: var(--fs-3);
            transition: var(--transition-1);
        }

        .hero-card .card-title:is(:hover, :focus) { color: var(--tan-crayola); }





        /*-----------------------------------*\
          #ABOUT
        \*-----------------------------------*/

        .about { text-align: center; }

        .about .section-title {
            font-family: var(--ff-mr_de_haviland);
            font-size: var(--fs-1);
            font-weight: var(--fw-500);
        }

        .about .section-text { margin-block: 12px 45px; }

        .about-card { position: relative; }

        .about-card .img-cover { transition: var(--transition-2); }

        .about-card:is(:hover, :focus) .img-cover { transform: scale(1.1); }

        .about-card .play-btn {
            position: absolute;
            inset: 0;
            display: grid;
            place-content: center;
            color: var(--white);
            font-size: 80px;
            transition: var(--transition-2);
        }

        .about-card:is(:hover, :focus) .play-btn { background-color: var(--black_50); }





        /*-----------------------------------*\
          #PRODUCT
        \*-----------------------------------*/

        .product .section-title { text-align: center; }

        .filter-btn-list {
            margin-block: 20px 50px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .filter-btn-item {
            position: relative;
            display: flex;
        }

        .filter-btn-item:not(:last-child)::after {
            content: "|";
            margin-inline: 15px;
        }

        .filter-btn { transition: var(--transition-1); }

        .filter-btn.active { color: var(--tan-crayola); }

        .product-card { text-align: center; }

        .product-card .card-banner::before {
            inset: 0;
            background-color: var(--black_10);
            opacity: 0;
            transition: var(--transition-1);
        }

        .product-card .card-banner:is(:hover, :focus-within)::before { opacity: 1; }

        .product-card .card-action-list {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, 100%);
            display: flex;
            gap: 15px;
            opacity: 0;
            transition: var(--transition-2);
        }

        .product-card .card-banner:is(:hover, :focus-within) .card-action-list {
            transform: translate(-50%, -50%);
            opacity: 1;
        }

        .product-card .card-action-btn {
            background-color: var(--white);
            font-size: 22px;
            padding: 12px;
            border-radius: 50%;
            transition: var(--transition-1);
        }

        .product-card .card-action-btn:is(:hover, :focus) { color: var(--tan-crayola); }

        .product-card .badge-list {
            position: absolute;
            top: 15px;
            left: 15px;
        }

        .product-card .badge {
            color: var(--white);
            font-size: var(--fs-5);
            font-weight: var(--fw-500);
            width: 45px;
            height: 45px;
            border-radius: 50%;
            line-height: 45px;
            margin-block-end: 10px;
        }

        .product-card .badge.orange { background-color: var(--red-orange-color-wheel); }

        .product-card .badge.cyan { background-color: var(--middle-blue-green); }

        .product-card .card-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: var(--black);
            color: var(--white);
            font-weight: var(--fw-500);
            padding-inline: 15px;
        }

        .product-card .h3 { font-size: unset; }

        .product-card .card-title {
            color: var(--smokey-black);
            font-weight: var(--fw-500);
            margin-block: 18px 5px;
            transition: var(--transition-1);
        }

        .product-card .card-title:is(:hover, :focus) { color: var(--tan-crayola); }

        .product-card .card-price {
            display: flex;
            justify-content: center;
            gap: 15px;
            color: var(--granite-gray);
            font-size: var(--fs-4);
        }

        .product-card .card-price .del { color: var(--spanish-gray); }

        .product-list > * { display: none; }

        .product-list[data-filter="all"] > *,
        .product-list[data-filter="accessory"] > .accessory,
        .product-list[data-filter="decoration"] > .decoration,
        .product-list[data-filter="furniture"] > .furniture {
            display: block;
            animation: fadeUp 1s ease forwards;
        }

        @keyframes fadeUp {
            0% {
                opacity: 0;
                transform: translateY(10px);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }





        /*-----------------------------------*\
          #BLOG
        \*-----------------------------------*/

        .blog .title-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 10px 50px;
            margin-block-end: 50px;
        }

        .blog .btn-link {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: var(--fw-500);
            transition: var(--transition-1);
        }

        .blog .btn-link:is(:hover, :focus) { color: var(--tan-crayola); }

        .blog-card .card-banner { position: relative; }

        .blog-card .card-btn {
            position: absolute;
            bottom: 0;
            right: 0;
            background-color: var(--white);
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 5px 15px;
            transform: translateX(100%);
            transition: var(--transition-2);
        }

        .blog-card:is(:hover, :focus) .card-btn { transform: translateX(0); }

        .blog-card .card-title {
            margin-block: 20px 10px;
            transition: var(--transition-1);
        }

        .blog-card .card-title:is(:hover, :focus) { color: var(--tan-crayola); }

        .blog-card .card-meta-list {
            display: flex;
            align-items: center;
        }

        .card-meta-item {
            position: relative;
            color: var(--granite-gray);
            font-size: var(--fs-5);
        }

        .card-meta-item:not(:last-child)::after {
            content: "/";
            margin-inline: 8px;
            color: var(--spanish-gray);
        }

        .card-meta-text {
            display: inline-block;
            color: var(--black);
            transition: var(--transition-1);
        }

        a.card-meta-text:is(:hover, :focus) { color: var(--tan-crayola); }





        /*-----------------------------------*\
          #NEWSLATTER
        \*-----------------------------------*/

        .newsletter {
            --section-padding: 20px;
            background-color: var(--cultured);
        }

        .newsletter-card { padding-inline: 15px; }

        .newsletter-card .card-content { margin-block-end: 40px; }

        .newsletter .section-title { margin-block-end: 8px; }

        .newsletter-card .h2 { --fs-2: 2.6rem; }

        .newsletter .card-form { position: relative; }

        .newsletter-card .email-field {
            background-color: var(--white);
            padding-block: 14px;
            padding-inline: 20px 50px;
            outline: 3px solid transparent;
            outline-offset: 0;
            transition: var(--transition-1);
        }

        .newsletter-card .email-field:focus { outline-color: var(--black_25); }

        .newsletter-btn {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            padding-inline: 20px;
        }





        /*-----------------------------------*\
          #FOOTER
        \*-----------------------------------*/

        .footer-top {
            display: grid;
            gap: 30px;
            padding-block-end: 40px;
        }

        .footer-list-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .footer-link {
            padding-block: 4px;
            transition: var(--transition-1);
        }

        .footer-link:is(:hover, :focus) { color: var(--tan-crayola); }

        .footer-brand .social-list { margin-block-start: 30px; }

        .footer-list-title {
            color: var(--smokey-black);
            font-size: var(--fs-4);
            font-weight: var(--fw-500);
            margin-block-end: 15px;
        }

        .footer-form { position: relative; }

        .footer .email-field {
            padding-block: 10px;
            padding-inline-end: 35px;
            border-block-end: 1px solid var(--black_25);
            outline: none;
        }

        .footer .email-field:focus { border-color: var(--tan-crayola); }

        .footer-form-btn {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            font-size: 20px;
            color: var(--granite-gray);
        }

        .footer-list .wrapper {
            display: flex;
            gap: 20px;
            margin-block-start: 20px;
        }

        .copyright {
            text-align: center;
            padding-block: 20px;
        }

        .copyright-link { display: inline-block; }





        /*-----------------------------------*\
          #BACK TO TOP
        \*-----------------------------------*/

        .back-top-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background-color: var(--tan-crayola);
            color: var(--white);
            font-size: 24px;
            padding: 18px;
            border-radius: 50%;
            z-index: 4;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition-1);
        }

        .back-top-btn.active {
            opacity: 1;
            visibility: visible;
            transform: translateY(-10px);
        }





        /*-----------------------------------*\
          #MEDIA QUERIES
        \*-----------------------------------*/

        /**
         * responsive for large than 575px screen
         */

        @media (min-width: 575px) {

            /**
             * REUSED STYLE
             */

            .container {
                max-width: 575px;
                width: 100%;
                margin-inline: auto;
            }

            .grid-list {
                grid-template-columns: 1fr 1fr;
                column-gap: 25px;
            }

            .grid-list > li:last-child {
                grid-column: span 2;
                max-width: calc(50% - 12.5px);
                width: 100%;
                margin-inline: auto;
            }



            /**
             * HEADER
             */

            .header .container { gap: 35px; }

            .header .input-wrapper {
                display: block;
                position: relative;
            }

            .header .input-field {
                padding-block: 10px;
                padding-inline-end: 30px;
                border-block-end: 1px solid var(--black_25);
                outline: none;
                transition: var(--transition-1);
            }

            .header .input-field::-webkit-search-cancel-button { display: none; }

            .header .input-field:focus { border-block-end-color: var(--tan-crayola); }

            .header .input-wrapper ion-icon {
                position: absolute;
                top: 50%;
                right: 0;
                transform: translateY(-50%);
                font-size: 24px;
            }

            .header-action { gap: 25px; }



            /**
             * NEWSLETTER
             */

            .newsletter { background: none; }

            .newsletter-card {
                background-color: var(--cultured);
                padding: 20px 30px;
            }



            /**
             * FOOTER
             */

            .footer-top { grid-template-columns: 1fr 1fr; }

        }





        /**
         * responsive for large than 768px screen
         */

        @media (min-width: 768px) {

            /**
             * REUSED STYLE
             */

            .container { max-width: 768px; }



            /**
             * HEADER
             */

            .header-action { gap: 35px; }

            .header .input-wrapper { width: 200px; }



            /**
             * HERO
             */

            .hero-list {
                grid-template-columns: repeat(4, 1fr);
                gap: 10px;
            }

            .hero-list .colspan-2 { grid-column: span 2; }



            /**
             * ABOUT
             */

            .about .section-text { margin-block-end: 75px; }



            /**
             * PRODUCT
             */

            .product .title-wrapper {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-block-end: 80px;
            }

            .filter-btn-list { margin: 0; }



            /**
             * NEWSLETTER
             */

            .newsletter-card { padding: 50px 70px; }

        }





        /**
         * responsive for large than 992px screen
         */

        @media (min-width: 992px) {

            /**
             * REUSED STYLE
             */

            .container { max-width: 992px; }

            .grid-list > li:last-child { all: unset; }

            .grid-list { grid-template-columns: repeat(3, 1fr); }



            /**
             * HERO
             */

            .hero-card .card-title { --fs-3: 2.2rem; }



            /**
             * ABOUT
             */

            .about .section-text {
                max-width: 85ch;
                margin-inline: auto;
            }



            /**
             * NEWSLETTER
             */

            .newsletter { --section-padding: 50px; }

            .newsletter-card {
                display: grid;
                grid-template-columns: 1fr 1fr;
                align-items: center;
                gap: 40px;
            }

            .newsletter-card .card-content { margin-block-end: 0; }



            /**
             * FOOTER
             */

            .footer-top {
                grid-template-columns: 1fr 0.75fr 0.6fr 1fr;
                padding-block-end: 60px;
            }

        }





        /**
         * responsive for large than 1200px screen
         */

        @media (min-width: 1200px) {

            /**
             * CUSTOM PROPERTY
             */

            :root {

                /**
                 * typography
                 */

                --fs-2: 3.6rem;

            }



            /**
             * REUSED STYLE
             */

            .container { max-width: 1200px; }



            /**
             * PRODUCT
             */

            .product-list { grid-template-columns: repeat(4, 1fr); }

        }
    </style>
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
        <section class="section product" id="product" aria-label="product">
            <div class="container">
                <div class="title-wrapper">
                    <h2 class="h2 section-title">Popular Products</h2>
                    <ul class="filter-btn-list">

                        <li class="filter-btn-item">
                            <button class="filter-btn active" data-filter-btn="all">All Products</button>
                        </li>

                        <li class="filter-btn-item">
                            <button class="filter-btn" data-filter-btn="accessory">Accessory</button>
                        </li>

                        <li class="filter-btn-item">
                            <button class="filter-btn" data-filter-btn="decoration">Decoration</button>
                        </li>

                        <li class="filter-btn-item">
                            <button class="filter-btn" data-filter-btn="furniture">Furniture</button>
                        </li>
                    </ul>
                </div>
                <ul class="grid-list product-list" data-filter="all">

                </ul>

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

<%--Fetch Products--%>
<script>
    function fetchProducts() {
        fetch('/ProductController?action=getProducts')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.text(); // Retrieve plain text response
            })
            .then(text => {
                const productList = document.querySelector('.grid-list.product-list');
                productList.innerHTML = ''; // Clear any existing list items

                const rows = text.trim().split('\n');
                const products = rows.map(rowData => {
                    return rowData.split(', ').reduce((acc, cell) => {
                        const [key, value] = cell.split(': ');
                        acc[key.trim()] = value ? value.trim() : '';
                        return acc;
                    }, {});
                });

                //console.log('Parsed products:', products); // Log parsed products for debugging

                products.forEach(product => {
                    const listItem = document.createElement('li');
                    listItem.classList.add('decoration');

                    const productCard = document.createElement('div');
                    productCard.classList.add('product-card');

                    const cardBanner = document.createElement('a');
                    cardBanner.href = '#';
                    cardBanner.classList.add('card-banner', 'img-holder', 'has-before');
                    cardBanner.style.setProperty('--width', '300px');
                    cardBanner.style.setProperty('--height', '300px');

                    const img = document.createElement('img');
                    img.src = `assets/images/` + product.images;;
                    img.width = 300;
                    img.height = 300;
                    img.loading = 'lazy';
                    img.alt = product.productName;
                    img.classList.add('img-cover');
                    cardBanner.appendChild(img);

                    const cardActionList = document.createElement('ul');
                    cardActionList.classList.add('card-action-list');

                    ['add-outline', 'bag-handle-outline', 'heart-outline'].forEach(iconName => {
                        const li = document.createElement('li');
                        const button = document.createElement('button');
                        button.classList.add('card-action-btn');
                        button.setAttribute('aria-label', iconName === 'add-outline' ? 'Add to cart' : iconName === 'bag-handle-outline' ? 'Add to cart' : 'Add to wishlist');
                        button.title = button.getAttribute('aria-label');
                        const icon = document.createElement('ion-icon');
                        icon.name = iconName;
                        icon.setAttribute('aria-hidden', 'true');
                        icon.value = product.productID; // Assuming productID is correctly set in your data
                        button.appendChild(icon);
                        li.appendChild(button);
                        cardActionList.appendChild(li);
                    });

                    cardBanner.appendChild(cardActionList);

                    if (product.productStatus === 'DRAFT') {
                        const draftBadge = document.createElement('div');
                        draftBadge.classList.add('card-badge');
                        draftBadge.textContent = 'Draft';
                        cardBanner.appendChild(draftBadge);
                    }

                    productCard.appendChild(cardBanner);

                    const cardContent = document.createElement('div');
                    cardContent.classList.add('card-content');

                    const cardTitle = document.createElement('h3');
                    cardTitle.classList.add('h3');
                    const titleLink = document.createElement('a');
                    titleLink.href = '#';
                    titleLink.classList.add('card-title');
                    titleLink.textContent = product.productName;
                    cardTitle.appendChild(titleLink);
                    cardContent.appendChild(cardTitle);

                    const productDescription = document.createElement('p');
                    productDescription.textContent = product.productDescription;
                    cardContent.appendChild(productDescription);

                    const cardPrice = document.createElement('div');
                    cardPrice.classList.add('card-price');
                    const price = document.createElement('data');
                    price.classList.add('price');
                    price.value = product.salesPrice;
                    price.textContent = product.salesPrice;
                    cardPrice.appendChild(price);
                    cardContent.appendChild(cardPrice);

                    const productDetails = document.createElement('div');
                    productDetails.classList.add('product-details');

                    const detailsList = document.createElement('ul');

                    // Constructing details list without template literals
                    [
                        { label: 'SKU', value: product.productSKU },
                        { label: 'Quantity', value: product.quantity },
                        { label: 'Material', value: product.material },
                        { label: 'Shape', value: product.shape },
                        { label: 'Color', value: product.color },
                        { label: 'Weight', value: product.weight },
                        { label: 'Dimensions', value: product.length + ' x ' + product.width + ' x ' + product.height }
                    ].forEach(detail => {
                        const detailItem = document.createElement('li');
                        const strong = document.createElement('strong');
                        strong.textContent = detail.label + ':';
                        detailItem.appendChild(strong);
                        detailItem.appendChild(document.createTextNode(' ' + detail.value));
                        detailsList.appendChild(detailItem);
                    });

                    productDetails.appendChild(detailsList);
                    cardContent.appendChild(productDetails);

                    productCard.appendChild(cardContent);
                    listItem.appendChild(productCard);
                    productList.appendChild(listItem);
                });
            })
            .catch(error => {
                console.error('Error fetching product data:', error);
                const productList = document.querySelector('.grid-list.product-list');
                productList.innerHTML = '<li><div class="product-card"><p>Error fetching product data.</p></div></li>';
            });
    }

    // Ensure the function is called to load the products when the page loads
    document.addEventListener('DOMContentLoaded', fetchProducts);
</script>






<%--<jsp:include page="assets/js/script.js" />--%>
<script src="assets/js/script.js" defer></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>