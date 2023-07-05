/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

public class Chart extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ivr", "postgres", "123");

            // Prepare SQL query
            String sql = "SELECT rating, COUNT(rating) AS count FROM user_ratings GROUP BY rating";
            stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            System.out.println("statment: " + stmt);

            // Execute the query
            rs = stmt.executeQuery();

            // Calculate total count
            int totalCount = 0;
            while (rs.next()) {
                totalCount += rs.getInt("count");
            }

            // Create JSON array to hold data
            JSONArray dataArray = new JSONArray();

            // Prepare chart data
            rs.beforeFirst(); // Move the cursor back to before the first row
            while (rs.next()) {
                int rating = rs.getInt("rating");
                int count = rs.getInt("count");
                double percentage = (count * 100.0) / totalCount;

                // Create JSON object for each rating
                JSONObject ratingObj = new JSONObject();
                ratingObj.put("label", "Rating " + rating);
                ratingObj.put("data", percentage);

                // Add rating object to the data array
                dataArray.put(ratingObj);
            }

            // Create JSON object to hold chart configuration
            JSONObject chartData = new JSONObject();
            chartData.put("labels", new String[]{"Rating 3", "Rating 5", "Rating 4", "Rating 2", "Rating 1"});
            chartData.put("datasets", dataArray);

            // Write JSON response
            out.println(chartData.toString());

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}


