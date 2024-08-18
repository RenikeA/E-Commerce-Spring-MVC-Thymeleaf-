package com.ecommerce.controllers;

import com.ecommerce.models.Product;
import com.ecommerce.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "addProduct":
                handleAddProduct(request, response);
                break;
            case "updateMainData":
                handleUpdateProductMain(request, response);
                break;
            case "updateProductQuantity":
                handleUpdateProductQuantity(request, response);
                break;
            case "updateProductPrice":
                handleUpdateProductPrice(request, response);
                break;
            case "updateProductMedia":
                handleUpdateProductMedia(request, response);
                break;
            case "updateProductAttribute":
                handleUpdateProductAttribute(request, response);
                break;
            case "updateProductStatus":
                handleUpdateProductStatus(request, response);
                break;
            case "deleteProduct":
                handleDeleteProduct(request, response);
                break;
            default:
                response.sendRedirect("error.jsp");
        }
    }

    private void handleAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate the current timestamp
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        // Get parameters from request
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productSKU = request.getParameter("productSKU");
        String productType = request.getParameter("productType");
        String itemClass = request.getParameter("itemClass");
        String productStatus = request.getParameter("productStatus");

        // Create a new Product object
        //Product newProduct = new Product(timestamp, productName, productDescription, productSKU, productType, itemClass);

        // Connect to the database and add the product
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {

                Map<String, String> columnValueMap = new HashMap<>();
                columnValueMap.put("productType", productType);
                columnValueMap.put("itemClass", itemClass);
                columnValueMap.put("productName", productName);
                columnValueMap.put("productDescription", productDescription);
                columnValueMap.put("productSKU", productSKU);
                columnValueMap.put("productStatus", "DRAFT");

                DBConnection.setNewRowData(connection, "product", columnValueMap);
                //response.sendRedirect("/product_added.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/add_product.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            //response.sendRedirect("/");
        }
    }

    private void handleUpdateProductMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String productID = request.getParameter("productID");
        String productType = request.getParameter("productType");
        String itemClass = request.getParameter("itemClass");
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productSKU = request.getParameter("productSKU");

        // Create a new Product object
        //Product updatedProduct = new Product(productID, productType, itemClass, productName, productDescription, productSKU);

        // Connect to the database and update the product quantity
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {
                // DBConnection.updateProductQuantity(connection, updatedProduct);

                System.out.println("Main Product Updating");

                System.out.println("Product ID: " + productID);
                System.out.println("Product Name: " + productName);
                System.out.println("Product Description: " + productDescription);
                System.out.println("product SKU: " + productSKU);

                // Create a map to hold column names and their corresponding values
                Map<String, String> columnValueMap = new HashMap<>();
                columnValueMap.put("productType", productType);
                columnValueMap.put("itemClass", itemClass);
                columnValueMap.put("productName", productName);
                columnValueMap.put("productDescription", productDescription);
                columnValueMap.put("productSKU", productSKU);

                // Update the address in the database
                DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "product", "productID", productID, columnValueMap);

                //response.sendRedirect("/product_quantity_updated.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/update_product_quantity.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    private void handleUpdateProductQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String productID = request.getParameter("productID");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String quantityUpdateUserID = request.getParameter("quantityUpdateUserID");
        String quantityUpdateDate = request.getParameter("quantityUpdateDate");

        // Create a new Product object
        //Product updatedProduct = new Product(productID, quantity, quantityUpdateUserID, quantityUpdateDate);

        // Connect to the database and update the product quantity
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {
                // DBConnection.updateProductQuantity(connection, updatedProduct);

                System.out.println("Product Quantity Updating");

                System.out.println("Product ID: " + productID);
                System.out.println("Quantity: " + quantity);
                System.out.println("Staff ID: " + quantityUpdateUserID);
                System.out.println("Update Timestamp: " + quantityUpdateDate);

                // Create a map to hold column names and their corresponding values
                Map<String, String> columnValueMap = new HashMap<>();
                columnValueMap.put("quantity", String.valueOf(quantity));
                columnValueMap.put("quantityUpdateUserID", quantityUpdateUserID);
                columnValueMap.put("quantityUpdateDate", quantityUpdateDate);

                // Update the address in the database
                DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "product", "productID", productID, columnValueMap);

                //response.sendRedirect("/product_quantity_updated.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/update_product_quantity.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    private void handleUpdateProductPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String productID = request.getParameter("productID");
        int costPrice = Integer.parseInt(request.getParameter("costPrice"));
        int salesPrice = Integer.parseInt(request.getParameter("salesPrice"));
        int lowStockPrice = Integer.parseInt(request.getParameter("lowStockPrice"));
        String priceUpdateUserID = request.getParameter("priceUpdateUserID");
        String priceUpdateDate = request.getParameter("priceUpdateDate");

        // Create a new Product object
        //Product updatedProduct = new Product(productID, costPrice, salesPrice, lowStockPrice, priceUpdateUserID, priceUpdateDate);


        System.out.println("Product Price Updating");

        // Connect to the database and update the product price
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {

                System.out.println("Product ID: " + productID);
                System.out.println("Cost Price: " + costPrice);
                System.out.println("Sales Price: " + salesPrice);
                System.out.println("Low Stock Price: " + lowStockPrice);
                System.out.println("Staff ID: " + priceUpdateUserID);
                System.out.println("Update Timestamp: " + priceUpdateDate);

                // Create a map to hold column names and their corresponding values
                Map<String, String> columnValueMap = new HashMap<>();
                columnValueMap.put("costPrice", String.valueOf(costPrice));
                columnValueMap.put("salesPrice", String.valueOf(salesPrice));
                columnValueMap.put("lowStockPrice", String.valueOf(lowStockPrice));
                columnValueMap.put("priceUpdateUserID", priceUpdateUserID);
                columnValueMap.put("priceUpdateDate", priceUpdateDate);

                // Update the address in the database
                DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "product", "productID", productID, columnValueMap);

                //response.sendRedirect("/product_price_updated.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/update_product_price.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    private void handleUpdateProductMedia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String productID = request.getParameter("productID");
        String images = request.getParameter("images");
        String videos = request.getParameter("videos");
        String mediaUpdateUserID = request.getParameter("mediaUpdateUserID");
        String mediaUpdateDate = request.getParameter("mediaUpdateDate");

        // Create a new Product object
        //Product updatedProduct = new Product(productID, images, videos, mediaUpdateUserID, mediaUpdateDate);

        System.out.println("Product Media Updating");

        // Connect to the database and update the product media
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {


                //System.out.println("Product ID: " + productID);
                //System.out.println("Images: " + images);
                //System.out.println("Videos: " + videos);
                //System.out.println("Staff ID: " + mediaUpdateUserID);
                //System.out.println("UpdateTimestamp: " + mediaUpdateDate);

                // Create a map to hold column names and their corresponding values
                Map<String, String> columnValueMap = new HashMap<>();
                columnValueMap.put("images", images);
                columnValueMap.put("videos", videos);
                columnValueMap.put("mediaUpdateUserID", mediaUpdateUserID);
                columnValueMap.put("mediaUpdateDate", mediaUpdateDate);

                // Update the address in the database
                DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "product", "productID", productID, columnValueMap);

                //response.sendRedirect("/product_media_updated.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/update_product_media.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    private void handleUpdateProductAttribute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String productID = request.getParameter("productID");
        String productAttribute = request.getParameter("productAttribute");
        String productAttributeValue = request.getParameter("productAttributeValue");
        String attributeUpdateUserID = request.getParameter("attributeUpdateUserID");
        String attributeUpdateDate = request.getParameter("attributeUpdateDate");

        // Create a new Product object
        //Product updatedProduct = new Product(productID, productAttribute, productAttributeValue, attributeUpdateUserID, attributeUpdateDate);

        System.out.println("Product Attribute Updating");

        // Connect to the database and update the product attribute
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {


                System.out.println("Product ID: " + productID);
                System.out.println("Attribute: " + productAttribute);
                System.out.println("Value: " + productAttributeValue);
                System.out.println("Staff ID: " + attributeUpdateUserID);
                System.out.println("Update Timestamp: " + attributeUpdateDate);

                // Create a map to hold column names and their corresponding values
                Map<String, String> columnValueMap = new HashMap<>();
                columnValueMap.put("productAttribute", productAttribute);
                columnValueMap.put("productAttributeValue", productAttributeValue);
                columnValueMap.put("attributeUpdateUserID", attributeUpdateUserID);
                columnValueMap.put("attributeUpdateDate", attributeUpdateDate);

                // Update the address in the database
                DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "product", "productID", productID, columnValueMap);

                //response.sendRedirect("/product_attribute_updated.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/update_product_attribute.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    private void handleUpdateProductStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String productID = request.getParameter("productID");
        String productStatus = request.getParameter("productStatus");
        String statusUpdateUserID = request.getParameter("statusUpdateUserID");
        String statusUpdateDate = request.getParameter("statusUpdateDate");

        // Create a new Product object
        Product updatedProduct = new Product(productID, productStatus, statusUpdateUserID, statusUpdateDate);

        System.out.println("Product Status Updating");

        // Connect to the database and update the product status
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {


                System.out.println("Product ID: " + productID);
                System.out.println("Status: " + productStatus);
                System.out.println("Staff ID: " + statusUpdateUserID);
                System.out.println("Update Timestamp: " + statusUpdateDate);

                // Create a map to hold column names and their corresponding values
                Map<String, String> columnValueMap = new HashMap<>();
                columnValueMap.put("productStatus", productStatus);
                columnValueMap.put("statusUpdateUserID", statusUpdateUserID);
                columnValueMap.put("statusUpdateDate", statusUpdateDate);

                // Update the address in the database
                DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "product", "productID", productID, columnValueMap);

                //response.sendRedirect("/product_status_updated.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/update_product_status.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    private void handleDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String productID = request.getParameter("productID");
        String productStatus = request.getParameter("productStatus");

        System.out.println("Product ID: " + productID);
        System.out.println("Status: " + productStatus);


        // Create a new Product object
        // Product updatedProduct = new Product(productID, productStatus, statusUpdateUserID, statusUpdateDate);

        // Connect to the database and update the product status
        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {

                // Update the address in the database
                DBConnection.deleteSingleRow(DBConnection.connectToDatabase(), "product", "productID", productID);

                //response.sendRedirect("/product_status_updated.jsp");
            } else {
                response.getWriter().write("Database connection error");
                //response.sendRedirect("/update_product_status.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    // GET

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Received action: " + action);

        switch (action) {
            case "getProducts":
                getProductTable(request, response);
                break;
            case "getProduct":
                getSingleProductData(request, response);
                break;
            case "getProductMap":
                getProductTableMap(request, response);
                break;
            default:
                response.sendRedirect("error.jsp");
        }
    }

    private void getProductTable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {
                String products = DBConnection.getWholeTableData(connection, "product");
                //System.out.println("Data retrieved:\n" + products);

                response.getWriter().write(products);
            } else {
                // Return an error message if the database connection fails
                response.getWriter().write("Database connection error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
        }
    }

    private void getProductTableMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {
                List<Map<String, Object>> productList = DBConnection.getWholeTableDataAsMap(connection, "Product");
                String jsonProducts = new Gson().toJson(productList);
                System.out.println(jsonProducts);
                response.getWriter().write(productList.toString());
            } else {
                // Handle database connection error
                response.getWriter().write("{\"error\": \"Database connection error\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\": \"Database error\"}");
        }
    }

    private void getSingleProductData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");

        System.out.println("Product ID: " + productID);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {
                Map<String, String> productData = DBConnection.getSingleRowDataAsMap(connection, "product", "productID", productID);
                Gson gson = new Gson();
                String productJson = gson.toJson(productData);

                response.getWriter().write(productJson);
            } else {
                response.getWriter().write("{\"error\": \"Database connection error\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\": \"Database error\"}");
        }
    }
}