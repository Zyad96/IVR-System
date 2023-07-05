/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author aisha
 */
@WebServlet(urlPatterns = {"/zyad"})
public class zyad extends HttpServlet {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/iti";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "139148";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            
            throws ServletException, IOException {
            PrintWriter out = response.getWriter(); // Obtain the PrintWriter object

        try {
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 Statement stmt = conn.createStatement()) {
                String sql = "SELECT rate, COUNT(rate) AS count FROM ratetable GROUP BY rate";
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int rating = rs.getInt("rate");
                    int count = rs.getInt("count");
                   out.println(rating);
                   out.println(count);
                    dataset.addValue(count, "Ratings", String.valueOf(rating));
                }

                rs.close();
            }

            JFreeChart chart = ChartFactory.createBarChart(
                    "Rating Distribution", // Chart title
                    "Rating", // X-Axis label
                    "Count", // Y-Axis label
                    dataset, // Dataset
                    PlotOrientation.VERTICAL, // Plot orientation
                    true, // Show legend
                    true, // Show tooltips
                    false // Show URLs
            );

            // Get the plot from the chart
            CategoryPlot plot = chart.getCategoryPlot();

            // Customize the appearance of the plot
            BarRenderer renderer = (BarRenderer) plot.getRenderer();
            renderer.setSeriesPaint(0, Color.BLUE); // Set the color of the bars

            // Create a buffered image from the chart
            int width = 600;
            int height = 400;
            BufferedImage bufferedImage = chart.createBufferedImage(width, height);

            // Set the response content type
            response.setContentType("image/png");

            // Write the image data to the response output stream
            OutputStream outputStream = response.getOutputStream();
            ImageIO.write(bufferedImage, "png", outputStream);
            outputStream.close();
        } catch (SQLException ex) {
            Logger.getLogger(zyad.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
