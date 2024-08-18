package com.ecommerce.utils;

import com.ecommerce.models.Product;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBConnection {


    private static HikariDataSource dataSource;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver Registered.");

            HikariConfig config = new HikariConfig();
            config.setJdbcUrl("jdbc:mysql://localhost:3306/ecommerce?serverTimezone=UTC");
            config.setUsername("root");
            config.setPassword("frigidon494$");
            config.addDataSourceProperty("cachePrepStmts", "true");
            config.addDataSourceProperty("prepStmtCacheSize", "250");
            config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

            dataSource = new HikariDataSource(config);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("MySQL JDBC Driver not found.");
        }
    }

    public static Connection connectToDatabase() {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // GETTERS

    // Function to get whole table data
    public static String getWholeTableData(Connection connection, String tableName) {
        List<Map<String, Object>> tableData = new ArrayList<>();
        StringBuilder tableString = new StringBuilder();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            //System.out.println("Executing query to fetch table data from table: " + tableName);
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM " + tableName);

            // Fetch table data
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            //System.out.println("Number of columns in the table: " + columnCount);

            while (resultSet.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnLabel(i);
                    Object columnValue = resultSet.getObject(i);
                    row.put(columnName, columnValue);
                    //System.out.println(columnName + ": " + columnValue);
                }
                tableData.add(row);
            }

            // System.out.println("Data fetched successfully. Number of rows: " + tableData.size());

            // Convert table data to a string representation
            for (Map<String, Object> row : tableData) {
                for (Map.Entry<String, Object> entry : row.entrySet()) {
                    tableString.append(entry.getKey()).append(": ").append(entry.getValue()).append(", ");
                }
                tableString.append("\n");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return tableString.toString();
    }

    public static List<Product> getWholeTableData2(Connection connection, String tableName) {
        List<Product> productList = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            System.out.println("Executing query to fetch table data from table: " + tableName);
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM " + tableName);

            while (resultSet.next()) {
                // Create a Product object and populate its fields from the result set
                Product product = new Product(
                        resultSet.getInt("increamentId"),
                        resultSet.getString("productID"),
                        resultSet.getString("timestamp"),
                        resultSet.getString("uuid"),
                        resultSet.getString("productType"),
                        resultSet.getString("itemClass"),
                        resultSet.getString("productName"),
                        resultSet.getString("productDescription"),
                        resultSet.getString("productSKU"),
                        resultSet.getInt("quantity"),
                        resultSet.getString("quantityUpdateUserID"),
                        resultSet.getString("quantityUpdateDate"),
                        resultSet.getInt("costPrice"),
                        resultSet.getInt("salesPrice"),
                        resultSet.getInt("lowStockPrice"),
                        resultSet.getString("priceUpdateUserID"),
                        resultSet.getString("priceUpdateDate"),
                        resultSet.getString("images"),
                        resultSet.getString("videos"),
                        resultSet.getString("mediaUpdateUserID"),
                        resultSet.getString("mediaUpdateDate"),
                        resultSet.getString("material"),
                        resultSet.getString("shape"),
                        resultSet.getString("color"),
                        resultSet.getString("weight"),
                        resultSet.getString("length"),
                        resultSet.getString("width"),
                        resultSet.getString("height"),
                        resultSet.getString("attributeUpdateUserID"),
                        resultSet.getString("attributeUpdateDate"),
                        resultSet.getString("statusUpdateUserID"),
                        resultSet.getString("statusUpdateDate"),
                        resultSet.getString("productStatus")
                );

                productList.add(product);
            }

            System.out.println("Data fetched successfully. Number of products: " + productList.size());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return productList;
    }

    public static List<Map<String, Object>> getWholeTableDataAsMap(Connection connection, String tableName) {
        List<Map<String, Object>> tableData = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM " + tableName);

            // Fetch table data
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            while (resultSet.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnLabel(i);
                    Object columnValue = resultSet.getObject(i);
                    row.put(columnName, columnValue);
                }
                tableData.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return tableData;
    }

    // Function to get single row data based on two search criteria
    public static boolean getSingleRowDataDual(Connection connection, String tableName, String searchColumn1, String searchValue1, String searchColumn2, String searchValue2) {
        boolean userFound = false;
        try {
            String query = "SELECT * FROM " + tableName + " WHERE " + searchColumn1 + " = ? AND " + searchColumn2 + " = ? LIMIT 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, searchValue1);
            preparedStatement.setString(2, searchValue2);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Print table data if found
            if (resultSet.next()) {
                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(metaData.getColumnLabel(i) + ": " + resultSet.getString(i) + "\t");
                }
                System.out.println();
                userFound = true;
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userFound;
    }

    // Function to get row data based on search criteria
    public static void getAllRowsData(Connection connection, String tableName, String searchColumn, String searchValue) {
        try {
            String query = "SELECT * FROM " + tableName + " WHERE " + searchColumn + " = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, searchValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Print column names
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(metaData.getColumnLabel(i) + "\t");
            }
            System.out.println();

            // Print table data
            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(resultSet.getString(i) + "\t");
                }
                System.out.println();
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Function to get single row data based on search criteria
    public static String getSingleRowData(Connection connection, String tableName, String searchColumn, String searchValue) {
        StringBuilder result = new StringBuilder();
        try {
            String query = "SELECT * FROM " + tableName + " WHERE " + searchColumn + " = ? LIMIT 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, searchValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Build the result string
            if (resultSet.next()) {
                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();
                for (int i = 1; i <= columnCount; i++) {
                    result.append(metaData.getColumnLabel(i)).append(": ").append(resultSet.getString(i));
                    if (i < columnCount) {
                        result.append("\t");
                    }
                }
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error: " + e.getMessage();
        }

        return result.toString();
    }

    // Function to get single cell data based on search criteria
    public static String getSingleCellData(Connection connection, String tableName, String searchColumn, String searchValue, String returnColumnCell) {
        String result = null;
        try {
            String query = "SELECT " + returnColumnCell + " FROM " + tableName + " WHERE " + searchColumn + " = ? LIMIT 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, searchValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Retrieve data if exists
            if (resultSet.next()) {
                result = resultSet.getString(1);
                System.out.println(returnColumnCell + ": " + result); // Optional logging
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }


    public static Map<String, String> getSingleRowDataAsMap(Connection connection, String tableName, String searchColumn, String searchValue) {
        Map<String, String> result = new HashMap<>();
        try {
            String query = "SELECT * FROM " + tableName + " WHERE " + searchColumn + " = ? LIMIT 1";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, searchValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();
                for (int i = 1; i <= columnCount; i++) {
                    result.put(metaData.getColumnLabel(i), resultSet.getString(i));
                }
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // SETTERS

    // Function to insert a new row of data into the table
    public static void setNewRowData(Connection connection, String tableName, Map<String, String> columnValueMap) {
        try {
            // Construct the query
            StringBuilder columns = new StringBuilder();
            StringBuilder placeholders = new StringBuilder();
            int i = 0;
            for (String column : columnValueMap.keySet()) {
                if (i > 0) {
                    columns.append(", ");
                    placeholders.append(", ");
                }
                columns.append(column);
                placeholders.append("?");
                i++;
            }

            String query = "INSERT INTO " + tableName + " (" + columns.toString() + ") VALUES (" + placeholders.toString() + ")";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            // Set the values
            int parameterIndex = 1;
            for (String value : columnValueMap.values()) {
                preparedStatement.setString(parameterIndex, value);
                parameterIndex++;
            }

            // Execute the query
            preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Function to insert user data into the database
    public static void setNewUserRowData(Connection connection, String firstName, String lastName, String email, int phoneNumber, String password) {
        try {
            String query = "INSERT INTO user (firstName, lastName, emailAddress, phoneNumber, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, email);
            preparedStatement.setInt(4, phoneNumber);
            preparedStatement.setString(5, password);

            // Execute the query
            preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Function to set cell data for multiple columns based on search criteria
    public static void setMultipleCellData(Connection connection, String tableName, String searchColumn, String searchValue, Map<String, String> columnValueMap) {
        try {
            StringBuilder queryBuilder = new StringBuilder("UPDATE " + tableName + " SET ");
            int i = 0;
            for (Map.Entry<String, String> entry : columnValueMap.entrySet()) {
                if (i > 0) {
                    queryBuilder.append(", ");
                }
                queryBuilder.append(entry.getKey()).append(" = ?");
                i++;
            }
            queryBuilder.append(" WHERE ").append(searchColumn).append(" = ?");
            PreparedStatement preparedStatement = connection.prepareStatement(queryBuilder.toString());

            int parameterIndex = 1;
            for (String value : columnValueMap.values()) {
                preparedStatement.setString(parameterIndex, value);
                parameterIndex++;
            }
            preparedStatement.setString(parameterIndex, searchValue);
            preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Function to set single cell data based on search criteria
    public static void setSingleCellData(Connection connection, String tableName, String searchColumn, String searchValue, String setColumnName, String setValue) {
        try {
            String query = "UPDATE " + tableName + " SET " + setColumnName + " = ? WHERE " + searchColumn + " = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, setValue);
            preparedStatement.setString(2, searchValue);
            preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    // DELETE

    // Function to delete a single row based on search criteria
    public static void deleteSingleRow(Connection connection, String tableName, String searchColumn, String searchValue) {
        try {
            String query = "DELETE FROM " + tableName + " WHERE " + searchColumn + " = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, searchValue);

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Row deleted successfully.");
            } else {
                System.out.println("No matching row found to delete.");
            }

            // Close resources
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}