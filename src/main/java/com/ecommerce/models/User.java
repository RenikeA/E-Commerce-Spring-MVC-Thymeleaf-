package com.ecommerce.models;

import com.ecommerce.enums.Role;

public class User {
    private int increamentId;
    private String userID;
    private String timestamp;
    private String uuid;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private int phoneNumber;
    private String password;

    // Address Information
    private String lastAddressUpdateUserID;
    private String lastAddressUpdateDate;
    private String homeAddress;
    private String city;
    private String state;
    private String country;
    // 10 EMPTY COLUMN SPACE

    // WishList
    private String wishListProductIDs;
    private String lastWishListUpdateUserID;
    private String lastWishListUpdateDate;
    // 10 EMPTY COLUMN SPACE

    // Cart Information
    private String lastCartUpdateUserID;
    private String lastCartUpdateDate;
    private String productIDCountMapping;
    private String productIDCountAmount;
    // 10 EMPTY COLUMN SPACE

    // Role
    private String lastRoleUpdateUserID;
    private String lastRoleUpdateDate;
    private Role role;

    // Full Variable Constructor
    public User(int increamentId, String userID, String timestamp, String uuid,
                String firstName, String lastName, String emailAddress, int phoneNumber,
                String password, String lastAddressUpdateUserID, String lastAddressUpdateDate, String homeAddress,
                String city, String state, String country, String lastRoleUpdateUserID, String lastRoleUpdateDate, Role role) {
        this.increamentId = increamentId;
        this.userID = userID;
        this.timestamp = timestamp;
        this.uuid = uuid;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.lastAddressUpdateUserID = lastAddressUpdateUserID;
        this.lastAddressUpdateDate = lastAddressUpdateDate;
        this.homeAddress = homeAddress;
        this.city = city;
        this.state = state;
        this.country = country;
        this.lastRoleUpdateUserID = lastRoleUpdateUserID;
        this.lastRoleUpdateDate = lastRoleUpdateDate;
        this.role = role;
    }

    // AddUser Constructor
    public User(String timestamp, String firstName, String lastName, String emailAddress, int phoneNumber,
                String password) {
        this.timestamp = timestamp;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

    // UpdateUserDeliveryAddress Constructor
    public User(String userID, String homeAddress, String city, String state, String country, String lastAddressUpdateUserID, String lastAddressUpdateDate) {
        this.userID = userID;
        this.homeAddress = homeAddress;
        this.city = city;
        this.state = state;
        this.country = country;
        this.lastAddressUpdateUserID = lastAddressUpdateUserID;
        this.lastAddressUpdateDate = lastAddressUpdateDate;
    }

    // UpdateUserWishList Constructor
    public User(String userID, String wishListProductIDs, String lastRoleUpdateUserID, String lastRoleUpdateDate) {
        this.userID = userID;
        this.wishListProductIDs = wishListProductIDs;
        this.lastWishListUpdateUserID = lastWishListUpdateUserID;
        this.lastWishListUpdateDate = lastWishListUpdateDate;
    }

    // UpdateUserCartList Constructor
    public User(String userID, String productIDCountMapping, String productIDCountAmount, String lastCartUpdateUserID, String lastCartUpdateDate) {
        this.userID = userID;
        this.productIDCountMapping = productIDCountMapping;
        this.productIDCountAmount = productIDCountAmount;
        this.lastCartUpdateUserID = lastCartUpdateUserID;
        this.lastCartUpdateDate = lastCartUpdateDate;
    }

    // UpdateUserRole Constructor
    public User(String userID, Role role, String lastRoleUpdateUserID, String lastRoleUpdateDate) {
        this.userID = userID;
        this.role = role;
        this.lastRoleUpdateUserID = lastRoleUpdateUserID;
        this.lastRoleUpdateDate = lastRoleUpdateDate;
    }

}
