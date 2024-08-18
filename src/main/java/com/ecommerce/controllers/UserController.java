package com.ecommerce.controllers;

import com.ecommerce.models.User;
import com.ecommerce.utils.DBConnection;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Received action: " + action);

        if ("login".equals(action)) {
            handleLogin(request, response);
        } else if ("register".equals(action)) {
            handleRegistration(request, response);
        } else if ("checkout".equals(action)) {
            updateAddress(request, response);
        } else if ("wishlistAction".equals(action)) {
            wishlistAction(request, response);
        } else if ("addToCartAction".equals(action)) {
            cartAction(request, response);
        } else if ("updateUserRole".equals(action)) {
            updateUserRole(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("emailAddress");
        String password = request.getParameter("password");

        Connection connection = DBConnection.connectToDatabase();

        if (connection == null) {
            response.getWriter().write("Database connection error");
            response.sendRedirect("/");
            return;
        }

        try (connection) {
            boolean userFound = DBConnection.getSingleRowDataDual(connection, "user", "emailAddress", email, "password", password);
            if (userFound) {
                String userID = DBConnection.getSingleCellData(connection, "user", "emailAddress", email, "userID");
                String role = DBConnection.getSingleCellData(connection, "user", "emailAddress", email, "role");

                HttpSession session = request.getSession();
                session.setAttribute("userID", userID); // Store user ID in session
                session.setAttribute("loggedInUser", email); // Store email in session
                session.setAttribute("role", role); // Store user role in session

                if ("ADMIN".equals(role)) {
                    response.sendRedirect("/inventory.jsp");
                } else {
                    response.sendRedirect("/catalogue.jsp");
                }
            } else {
                response.getWriter().write("User not found");
                response.sendRedirect("/login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
            response.sendRedirect("/");
        }
    }

    // Other methods remain the same...
    private void handleRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate the current timestamp
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        // Get parameters from request
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber")); // Parse phoneNumber to int
        String password = request.getParameter("password");

        // Create a new User object using the appropriate constructor
        User newUser = new User(timestamp, firstName, lastName, emailAddress, phoneNumber, password);

        // In a real application, you would save the user data to a database
        // For demonstration purposes, let's just print the received data
        // System.out.println("Registration - First Name: " + firstName);
        // System.out.println("Registration - Last Name: " + lastName);
        // System.out.println("Registration - Email: " + emailAddress);
        // System.out.println("Registration - Phone Number: " + phoneNumber);
        // System.out.println("Registration - Password: " + password);

        // Connect to the database
        Connection connection = DBConnection.connectToDatabase();

        if (connection != null) {

            Map<String, String> columnValueMap = new HashMap<>();
            columnValueMap.put("firstName", firstName);
            columnValueMap.put("lastName", lastName);
            columnValueMap.put("emailAddress", emailAddress);
            columnValueMap.put("phoneNumber", String.valueOf(phoneNumber));
            columnValueMap.put("password", password);

            // Insert user data into the database
            DBConnection.setNewRowData(connection,"user", columnValueMap);

            // For simplicity, let's assume the registration is successful
            // and redirect the user to the home page
            response.sendRedirect("/login.jsp");

            // Close the connection
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Failed to make a connection to the database.");
            response.sendRedirect("/register.jsp");
        }
    }

    private void updateAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String userID = request.getParameter("userID");
        String homeAddress = request.getParameter("homeAddress");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String lastAddressUpdateUserID = request.getParameter("lastAddressUpdateUserID");
        String lastAddressUpdateDate = request.getParameter("lastAddressUpdateDate");


        // System.out.println("Registration - First Name: " + homeAddress);
        // System.out.println("Registration - Last Name: " + city);
        // System.out.println("Registration - Email: " + state);
        // System.out.println("Registration - Phone Number: " + country);
        // System.out.println("Registration - Password: " + lastAddressUpdateUserID);

        // Create a map to hold column names and their corresponding values
        Map<String, String> columnValueMap = new HashMap<>();
        columnValueMap.put("homeAddress", homeAddress);
        columnValueMap.put("city", city);
        columnValueMap.put("state", state);
        columnValueMap.put("country", country);
        columnValueMap.put("lastAddressUpdateUserID", lastAddressUpdateUserID);
        columnValueMap.put("lastAddressUpdateDate", lastAddressUpdateDate);

        // Update the address in the database
        DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "users", "userID", userID, columnValueMap);

        // Redirect the user to a confirmation page
        //response.sendRedirect("/address_updated.jsp");
    }

    private void wishlistAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String userID = request.getParameter("userID");
        String wishListProductIDs = request.getParameter("wishListProductIDs");
        String lastWishListUpdateUserID = request.getParameter("lastWishListUpdateUserID");
        String lastWishListUpdateDate = request.getParameter("lastWishListUpdateDate");

        // Wishlist management code
        System.out.println("User ID: " + userID);
        System.out.println("Product ID: " + wishListProductIDs);
        System.out.println("Staff ID: " + lastWishListUpdateUserID);
        System.out.println("Update Timestamp: " + lastWishListUpdateDate);

        try (Connection connection = DBConnection.connectToDatabase()) {
            // Fetch current wishlist product IDs for the user
            String currentWishListProductIDs = DBConnection.getSingleCellData(connection, "user", "userID", userID, "wishListProductIDs");

            // Handle null value by initializing to an empty string
            if (currentWishListProductIDs == null) {
                currentWishListProductIDs = "";
                System.out.println("Empty Value");
            }

            // Split the current wish list product IDs into a set for easier manipulation
            Set<String> wishListSet = new HashSet<>(Arrays.asList(currentWishListProductIDs.split(",")));

            // If the product ID is already in the set, remove it; otherwise, add it
            if (wishListSet.contains(wishListProductIDs)) {
                 System.out.println("Already Exist. Removing...");
                wishListSet.remove(wishListProductIDs);
            } else {
                 System.out.println("Does Not Exist. Adding...");
                wishListSet.add(wishListProductIDs);
            }

            // Join the set back into a comma-separated string
            String updatedWishListProductIDs = String.join(",", wishListSet);

            // Create a map to hold column names and their corresponding values
            Map<String, String> columnValueMap = new HashMap<>();
            columnValueMap.put("wishListProductIDs", updatedWishListProductIDs);
            columnValueMap.put("lastWishListUpdateUserID", lastWishListUpdateUserID);
            columnValueMap.put("lastWishListUpdateDate", lastWishListUpdateDate);

            // Update the user's wish list in the database
            DBConnection.setMultipleCellData(connection, "user", "userID", userID, columnValueMap);

            // Redirect the user to a confirmation page
            //response.sendRedirect("/addedToWishlist.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\": \"Database error\"}");
        }
    }

    private void cartAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String userID = request.getParameter("userID");
        String productID = request.getParameter("cartProductID"); // Assuming you are getting the product ID as a separate parameter
        String productIDCountAmount = request.getParameter("productIDCountAmount");
        String lastCartUpdateUserID = request.getParameter("lastCartUpdateUserID");
        String lastCartUpdateDate = request.getParameter("lastCartUpdateDate");

        // Cart management code
        System.out.println("User ID: " + userID);
        System.out.println("Product ID: " + productID);
        System.out.println("Staff ID: " + lastCartUpdateUserID);
        System.out.println("Update Timestamp: " + lastCartUpdateDate);

        try (Connection connection = DBConnection.connectToDatabase()) {
            // Fetch current cart product IDs for the user
            String currentProductIDCountMapping = DBConnection.getSingleCellData(connection, "user", "userID", userID, "productIDCountMapping");

            // Handle null value by initializing to an empty string
            if (currentProductIDCountMapping == null) {
                currentProductIDCountMapping = "";
            }

            // Split the current product ID count mapping into a list for easier manipulation
            List<String> productList = new ArrayList<>(Arrays.asList(currentProductIDCountMapping.split(",")));

            // Flag to indicate if the product ID was found
            boolean found = false;

            // Iterate over the product list to find and remove the productID if it exists
            Iterator<String> iterator = productList.iterator();
            while (iterator.hasNext()) {
                String productEntry = iterator.next();
                if (productEntry.startsWith(productID + "|")) {
                    System.out.println("Already Exist. Removing...");
                    iterator.remove(); // This removes the entire productID|count entry
                    found = true;
                    break;
                }
            }

            // If the product ID was not found, add it with count 1
            if (!found) {
                System.out.println("Does Not Exist. Adding...");
                productList.add(productID + "|1");
            }

            // Join the list back into a comma-separated string
            String updatedProductIDCountMapping = String.join(",", productList);

            // Create a map to hold column names and their corresponding values
            Map<String, String> columnValueMap = new HashMap<>();
            columnValueMap.put("productIDCountMapping", updatedProductIDCountMapping);
            columnValueMap.put("lastCartUpdateUserID", lastCartUpdateUserID);
            columnValueMap.put("lastCartUpdateDate", lastCartUpdateDate);

            // Update the user's cart in the database
            DBConnection.setMultipleCellData(connection, "user", "userID", userID, columnValueMap);

            // Redirect the user to a confirmation page
            //response.sendRedirect("/addedToCart.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\": \"Database error\"}");
        }
    }

    private void updateUserRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String userID = request.getParameter("userID");
        //Role role = Role.valueOf(request.getParameter("role"));
        String role = request.getParameter("role");
        String lastRoleUpdateUserID = request.getParameter("lastRoleUpdateUserID");
        String lastRoleUpdateDate = request.getParameter("lastRoleUpdateDate");

        // Create a new User object using the appropriate constructor
        User updatedUser = new User(userID, role, lastRoleUpdateUserID, lastRoleUpdateDate);

        // Wishlist management code
        System.out.println("User ID: " + userID);
        System.out.println("Role: " + role);
        System.out.println("Staff ID: " + lastRoleUpdateUserID);
        System.out.println("Update Timestamp: " + lastRoleUpdateDate);

        // Create a map to hold column names and their corresponding values
        Map<String, String> columnValueMap = new HashMap<>();
        columnValueMap.put("role", role);
        columnValueMap.put("lastRoleUpdateUserID", lastRoleUpdateUserID);
        columnValueMap.put("lastRoleUpdateDate", lastRoleUpdateDate);

        // Update the address in the database
        DBConnection.setMultipleCellData(DBConnection.connectToDatabase(), "user", "userID", userID, columnValueMap);

        // Update user role code
    }


    // GET REQUESTS

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Received action: " + action);

        switch (action) {
            case "getUsers":
                getUserTable(request, response);
                break;
            case "getUser":
                getSingleUserData(request, response);
                break;
            default:
                response.sendRedirect("error.jsp");
        }
    }

    private void getUserTable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        try (Connection connection = DBConnection.connectToDatabase()) {
            if (connection != null) {
                String users = DBConnection.getWholeTableData(connection, "user");
                //System.out.println("Data retrieved:\n" + users);
                response.getWriter().write(users);
                request.setAttribute("users", users);
            } else {
                // Return an error message if the database connection fails
                response.getWriter().write("Database connection error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error");
        }
    }

    private void getSingleUserData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            String userID = (String) session.getAttribute("userID");

            if (userID != null) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                try (Connection connection = DBConnection.connectToDatabase()) {
                    if (connection != null) {
                        Map<String, String> userData = DBConnection.getSingleRowDataAsMap(connection, "user", "userID", userID);
                        Gson gson = new Gson();
                        String userJson = gson.toJson(userData);

                        response.getWriter().write(userJson);
                    } else {
                        response.getWriter().write("{\"error\": \"Database connection error\"}");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.getWriter().write("{\"error\": \"Database error\"}");
                }
            } else {
                response.getWriter().write("{\"error\": \"User not logged in\"}");
            }
        } else {
            response.getWriter().write("{\"error\": \"Session not found\"}");
        }
    }

}