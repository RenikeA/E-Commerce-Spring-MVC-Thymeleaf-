package com.ecommerce;

import com.ecommerce.utils.DBConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class App {
    public static void main(String[] args) {
        Connection connection = null;
        try {
            connection = DBConnection.connectToDatabase();
            if (connection != null) {
                System.out.println("USER DATABASE CONSOLE DISPLAY");
                List<Map<String, Object>> userTableData = DBConnection.getWholeTableDataAsMap(connection, "User");
                printTableData(userTableData);
                System.out.println();

                System.out.println("PRODUCT DATABASE CONSOLE DISPLAY");
                List<Map<String, Object>> productTableData = DBConnection.getWholeTableDataAsMap(connection, "Product");
                printTableData(productTableData);

                // Test delete functionality
                String tableName = "Product"; // Replace with your table name
                String searchColumn = "productID"; // Replace with the column name you are searching by
                String searchValue = "product9"; // Replace with the specific value of the ID you want to delete

                System.out.println("\nDeleting product with ID " + searchValue);
                DBConnection.deleteSingleRow(connection, tableName, searchColumn, searchValue);
                System.out.println("Product deleted successfully.");

                // Display updated table after deletion
                System.out.println("\nPRODUCT DATABASE AFTER DELETION");
                List<Map<String, Object>> updatedProductTableData = DBConnection.getWholeTableDataAsMap(connection, "Product");
                printTableData(updatedProductTableData);
            }
        } finally {
            // Close the connection after all operations
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static void printTableData(List<Map<String, Object>> tableData) {
        for (Map<String, Object> row : tableData) {
            for (Map.Entry<String, Object> entry : row.entrySet()) {
                System.out.print(entry.getKey() + ": " + entry.getValue() + ", ");
            }
            System.out.println();
        }
    }
}
