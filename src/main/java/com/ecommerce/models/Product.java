package com.ecommerce.models;

import com.ecommerce.enums.ProductStatus;

public class Product {
    private int increamentId;
    private String productID;

    // Basic
    private String timestamp;
    private String uuid;
    private String productType;
    private String itemClass;
    private String productName;
    private String productDescription;
    private String productSKU;

    // Quantity
    private String quantityUpdateUserID;
    private String quantityUpdateDate;
    private int quantity;

    // Price
    private String priceUpdateUserID;
    private String priceUpdateDate;
    private Integer costPrice;
    private Integer salesPrice;
    private Integer lowStockPrice;

    // Media
    private String mediaUpdateUserID;
    private String mediaUpdateDate;
    private String images;
    private String videos;

    // Attributes
    private String attributeUpdateUserID;
    private String attributeUpdateDate;
    private String material;
    private String shape;
    private String color;
    private String weight;
    private String length;
    private String width;
    private String height;

    //Status
    private String statusUpdateUserID;
    private String statusUpdateDate;
    private String productStatus;

    // Full Product Variable Constructor
    public Product(int increamentId, String productID, String timestamp, String uuid,
                   String productType, String itemClass, String productName,
                   String productDescription, String productSKU, int quantity,
                   String quantityUpdateUserID,
                   String quantityUpdateDate, Integer costPrice, Integer salesPrice,
                   Integer lowStockPrice,
                   String priceUpdateUserID,
                   String priceUpdateDate, String images,
                   String videos, String mediaUpdateUserID, String mediaUpdateDate, String material,
                   String shape, String color, String weight, String length,
                   String width, String height, String attributeUpdateUserID, String attributeUpdateDate, String statusUpdateUserID, String statusUpdateDate,
                   String productStatus) {
        this.increamentId = increamentId;
        this.productID = productID;
        this.timestamp = timestamp;
        this.uuid = uuid;
        this.productType = productType;
        this.itemClass = itemClass;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productSKU = productSKU;
        this.quantityUpdateDate = quantityUpdateDate;
        this.quantityUpdateUserID = quantityUpdateUserID;
        this.quantity = quantity;
        this.priceUpdateUserID = priceUpdateUserID;
        this.priceUpdateDate = priceUpdateDate;
        this.costPrice = costPrice;
        this.salesPrice = salesPrice;
        this.lowStockPrice = lowStockPrice;
        this.mediaUpdateUserID = mediaUpdateUserID;
        this.mediaUpdateDate = mediaUpdateDate;
        this.images = images;
        this.videos = videos;
        this.attributeUpdateUserID = attributeUpdateUserID;
        this.attributeUpdateDate = attributeUpdateDate;
        this.material = material;
        this.shape = shape;
        this.color = color;
        this.weight = weight;
        this.length = length;
        this.width = width;
        this.height = height;
        this.statusUpdateUserID = statusUpdateUserID;
        this.statusUpdateDate = statusUpdateDate;
        this.productStatus = productStatus;
    }

    // Add Product Constructor
    // Update Media Constructor
    public Product(String productType, String itemClass, String productName, String productDescription,
                   String productSKU) {
        this.productType = productType;
        this.itemClass = itemClass;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productSKU = productSKU;
    }

    // Update Quantity Constructor
    public Product(String productID, int quantity, String quantityUpdateUserID, String quantityUpdateDate) {
        this.productID = productID;
        this.quantity = quantity;
        this.quantityUpdateUserID = quantityUpdateUserID;
        this.quantityUpdateDate = quantityUpdateDate;
    }

    // Update Price Constructor
    public Product(String productID, Integer costPrice,
                   Integer salesPrice, Integer lowStockPrice, String priceUpdateUserID, String priceUpdateDate) {
        this.productID = productID;
        this.costPrice = costPrice;
        this.salesPrice = salesPrice;
        this.lowStockPrice = lowStockPrice;
        this.priceUpdateUserID = priceUpdateUserID;
        this.priceUpdateDate = priceUpdateDate;
    }

    // Update Media Constructor
//    public Product(String productID, String images, String videos, String mediaUpdateUserID, String mediaUpdateDate) {
//        this.productID = productID;
//        this.images = images;
//        this.videos = videos;
//        this.mediaUpdateUserID = mediaUpdateUserID;
//        this.mediaUpdateDate = mediaUpdateDate;
//    }

    // Update Attribute Constructor
    public Product(String productID, String material,
                   String shape, String color, String weight, String length,
                   String width, String height, String attributeUpdateUserID, String attributeUpdateDate) {
        this.productID = productID;
        this.material = material;
        this.shape = shape;
        this.color = color;
        this.weight = weight;
        this.length = length;
        this.width = width;
        this.height = height;
        this.attributeUpdateUserID = attributeUpdateUserID;
        this.attributeUpdateDate = attributeUpdateDate;
    }

    // Update Status Constructor
    public Product(String productID, String productStatus, String statusUpdateUserID, String statusUpdateDate) {
        this.productID = productID;
        this.productStatus = productStatus;
        this.statusUpdateUserID = statusUpdateUserID;
        this.statusUpdateDate = statusUpdateDate;
    }

}